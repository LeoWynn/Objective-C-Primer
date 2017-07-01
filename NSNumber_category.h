//
//  NSNumber_category.h
//  OCLearn
//
//  Created by coreos on 4/13/17.
//  Copyright © 2017 Leo Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

//类别的定义，可以增加方法，不可以增加成员变量
//利用类别对类进行模块化设计
//使用类别来调用私有方法
//使用类别实现非正式协议
@interface NSNumber (fk)

//
- (NSNumber*) add: (double) num2;
- (NSNumber*) substract: (double) num2;
- (NSNumber*) multiply: (double) num2;
- (NSNumber*) divide: (double) num2;


@end

//扩展extension，
//可以增加类的成员变量，
