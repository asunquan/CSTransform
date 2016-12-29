//
//  DemoObject.h
//  CSTransformDemo
//
//  Created by Suns孙泉 on 2016/12/28.
//  Copyright © 2016年 cyou-inc.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Experiences, Social;

@interface DemoObject : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *sex;

@property (nonatomic, strong) NSNumber *age;

@property (nonatomic, strong) NSArray<NSString *> *friends;

@property (nonatomic, strong) Experiences *experiences;

@property (nonatomic, strong) NSArray<Social *> *socials;

@property (nonatomic, strong) NSArray *a;

@end
