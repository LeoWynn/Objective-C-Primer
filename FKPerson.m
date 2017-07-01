//
//  FKPerson.m
//  FKPerson
//
//  Created by coreos on 2/11/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#import "FKPerson.h"

@implementation FKPerson

//property合成的属性，自动合成了setter和getter方法，默认方法名加下划线前缀，也可用@synthesize指定方法名
//@synthesize birth = _birth;

//KVO
- (void) showItemInfo
{
    NSLog(@"item物品名称为：%@,物品价格为：%d",self.item.name,self.item.price);
}
//自定义setItem:方法
- (void) setItem:(FKPerson *)item
{
    self.item = item;
    //添加监听器，监听name
    [self.item addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    //监听price
    [self.item addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew context:nil];
}

//重写observeValueForKeyPath方法
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"--observeValueForKeyPath方法背调用--");
    //
    NSLog(@"背修改的keyPath: %@", keyPath);
    NSLog(@"背修改的对象为:%@",object);
    NSLog(@"背修改的上下文：%@", context);
}

- (void) dealloc
{
    //删除监听器
    [self.item removeObserver:self forKeyPath:@"name"];
    [self.item removeObserver:self forKeyPath:@"price"];
    NSLog(@"dealloc KVO successfully.");
}

- (void) setName:(NSString *)name
{
    //要求用法名必须在2-10之间
    if ([name length]>10 || [name length]<2) {
        NSLog(@"您设置的人名不符合要求");
        return;
    }
    else
    {
        _name = name;
    }
}

- (NSString*) name
{
    return _name;
}

- (void) setAge:(int)age
{
    if (age > 100 || age < 0) {
        NSLog(@"您设置的年龄不合法。");
        return;
    }
    else
    {
        _age = age;
    }
}

- (int) age
{
    return _age;
}

- (void) test: (NSString*) name, ...
{
    //定义一个va_list的指针变量，该指针变量指向可变参数列表
    va_list argList;
    
    if (name) {
        //name不在可变参数列表中
        NSLog(@"%@",name);
        
        //指向第一个可变参数列表的第一个参数，开始提取可变参数列表的参数
        va_start(argList, name);
        
        //提取指针当前指向的参数，并指针下移
        NSString* var = va_arg(argList, id);
        while (var) {
            NSLog(@"%@",var);
            var = [[NSString alloc]init ];
            var = va_arg(argList, id);
        }
        va_end(argList); //释放指针
        
    }
}

//+ (NSString*) nation   //+ 类方法
//{
//    return nation;
//}
+ (void) setNation: (NSString*) newNation
{
    
}


@end