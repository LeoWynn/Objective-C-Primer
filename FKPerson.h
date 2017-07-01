//
//  FKPerson.h
//  OCLearn
//
//  Created by coreos on 2/15/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#ifndef OCLearn_FKPerson_h
#define OCLearn_FKPerson_h

//1. 封装，使用访问控制符控制成员变量和方法的使用权限，@private,@package,@protected,@public
//@private:当前类访问权限
//@package:相同影射访问权限，编译后在统一框架或统一执行文件下，
//@protected:子类访问权限，当前类和子类中
//@public:公共访问权限，

#import <Foundation/Foundation.h>

//定义类的接口部分
@interface FKPerson : NSObject
{
    //定义成员变量
    @private    // 当前类访问权限
    NSString * _name;
    int _age;
   
    
}

//property合成的属性，自动合成了setter和getter方法，默认方法名加下划线前缀，也可用@synthesize指定方法名
@property NSDate* birth;

//atomic原子操作，指是否线程安全，noatomic,
//assign

@property (atomic) NSDate* birth1;

//copy,复制一个副本，不会因为赋值而改变
//@property (nonatomic) NSString* bookname;
//readonly,readwrite,retain,
//strong,weak
//unsafe_unretained,
@property (nonatomic, copy) NSString* bookname;

//KVO
@property (nonatomic, weak) NSString* name;
@property (nonatomic) int price;
@property (nonatomic, weak) FKPerson* item;
- (void) showItemInfo;





//提供方法操作_name成员变量
- (void) setName: (NSString*) name;
//获取_name成员变量
- (NSString*) name;

//设置_age
- (void) setAge: (int) age;
//获取age
- (int) age;

- (void) test: (NSString*) name, ...;   //  定义一个形参个数可变的方法

+ (NSString*) nation;   //+ 类方法
+ (void) setNation: (NSString*) newNation;


@end

#endif
