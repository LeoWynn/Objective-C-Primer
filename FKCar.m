//
//  FKPerson.m
//  FKPerson
//
//  Created by coreos on 2/11/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#import "FKCar.h"

@implementation FKCar

//重写init方法
- (id) init
{
    //self不为nil, 表明父类的初始化成功
    if (self = [super init]) {
        self.brand = @"奥迪";
        self.model = @"Q5";
        self.color = @"黑色";
    }
    return self;
}

- (id) initWithBrand:(NSString*) brand model: (NSString*) model
{
    if (self = [super init]) {
        self.brand = brand;
        self.model = model;
        self.color = @"黑色";
    }
    return self;
}

- (id) initWithBrand:(NSString *)brand model:(NSString *)model color:(NSString*) color
{
    if (self = [super init]) {
        self.brand = brand;
        self.model = model;
        self.color = color;
    }
    return self;
}





@end