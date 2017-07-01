//
//  FKPerson.m
//  FKPerson
//
//  Created by coreos on 2/11/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#import "FKSingleton.h"

//单例类，始终只能创建一个实例
@implementation FKSingleton

//单例类可通过static全局变量来实现
static id instance = nil;
+ (id) instance
{
    //如果instance全局变量为nil
    if (!instance) {
        //创建一个Singleton(单例)实例，并将该实例赋给instance全局变量
        instance = [[super alloc] init];
    }
    return instance;
}

+ (id) instance1
{
    id instance1 = nil;     //局部变量
    
    if (!instance1) {
        //创建一个Singleton(单例)实例，并将该实例赋给instance全局变量
        instance1 = [[super alloc] init];
    }
    return instance1;
}

@end
