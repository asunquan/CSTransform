//
//  CSTransform.m
//  CSTransformDemo
//
//  Created by Suns孙泉 on 2016/12/27.
//  Copyright © 2016年 cyou-inc.com. All rights reserved.
//

#import "CSTransform.h"

#import <objc/runtime.h>

@implementation CSTransform

+ (id)transformDictionary:(NSDictionary *)dictionary
             toModelClass:(__unsafe_unretained Class)modelClass
{
    // 创建模型对象
    id model = [[modelClass alloc] init];

    unsigned int count = 0;
    
    // 获取类中的所有成员属性
    Ivar *ivarList = class_copyIvarList(modelClass, &count);
    
    for (int i = 0; i < count; i++)
    {
        // 根据角标, 从数组取出对应的成员属性
        Ivar ivar = ivarList[i];
        
        // 获取成员属性名
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 去掉_就是真正的属性名
        NSString *propertyName = [name substringFromIndex:1];
        
        // 获取成员属性类型
        NSString *class = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        // 去掉@""就是真正的属性类型
        NSString *propertyClass = [class substringWithRange:NSMakeRange(2, class.length - 3)];
        
        // 根据属性名去查找字典中的value
        id value = dictionary[propertyName];

        // 如果value是字典
        if ([value isKindOfClass:[NSDictionary class]] && NSClassFromString(propertyClass))
        {
            value = [self transformDictionary:value
                                 toModelClass:NSClassFromString(propertyClass)];
        }
        
        /** 由于没有找到数组泛型的获取方法, 所以数组这里暂时无法继续, 相信有一天可以的
        // 如果value是数组
        if ([value isKindOfClass:[NSArray class]])
        {
        }
         */
        
        // 利用kvc赋值
        [model setValue:value forKey:propertyName];
    }
    
    free(ivarList);
    
    return model;
}

@end
