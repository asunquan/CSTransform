//
//  ViewController.m
//  CSTransformDemo
//
//  Created by Suns孙泉 on 2016/12/27.
//  Copyright © 2016年 cyou-inc.com. All rights reserved.
//

#import "ViewController.h"

#import "DemoObject.h"
#import "CSTransform.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dic = @{@"name" : @"king",
                          @"sex"  : @"male",
                          @"age"  : @30,
                          @"friends" : @[@"queen",
                                        @"ace",
                                        @"boss"],
                          @"experiences" : @{@"university" : @"None",
                                            @"team" : @"Cavaliers"},
                          @"socials" : @[@{@"facebook" : @"facebookID"}],
                          @"a" : @[@[@{@"ak1" : @"av1"},
                                     @{@"ak2" : @"av2"}]]};
    
//    NSMutableArray *result = [NSMutableArray array];
//    
//    [self resource:dic allKeys:result];
//    
//    NSLog(@"%@", result.description);
    
    DemoObject *object =  [CSTransform transformDictionary:dic
                                              toModelClass:[DemoObject class]];
    
    NSLog(@"%@", object.name);
}

// 获取一个数据中的全部key
- (void)resource:(id)resource allKeys:(NSMutableArray *)result
{
    if ([resource isKindOfClass:[NSDictionary class]])
    {
        [resource enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop)
         {
             if ([obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSArray class]])
             {
                 [self resource:obj allKeys:result];
             }
             
             [result addObject:key];
         }];
    }
    else if ([resource isKindOfClass:[NSArray class]])
    {
        [resource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             if ([obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSArray class]])
             {
                 [self resource:obj allKeys:result];
             }
         }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
