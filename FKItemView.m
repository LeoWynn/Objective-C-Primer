//
//  FKPerson.m
//  FKPerson
//
//  Created by coreos on 2/11/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#import "FKItemView.h"

@implementation FKItemView

//KVO
@synthesize item;

- (void) showItemInfo
{
    NSLog(@"item名称为：%@",self.item);
}
//自定义setItem:方法
- (void) setItem:(NSString *)item
{
    self.item = item;
    NSLog(@"item name: %@", self.item);
    //添加监听器，监听name
    [self.item addObserver:self forKeyPath:@"item" options:NSKeyValueObservingOptionNew context:nil];
    
}
//- (void) setItem:(NSString*) item1
//{
//    self.item = item1;
//    NSLog(@"item name: %@", self.item);
//    //添加监听器，监听name
//    [self.item addObserver:self forKeyPath:@"item" options:NSKeyValueObservingOptionNew context:nil];
//    //监听price
//    //[self.item addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew context:nil];
//}

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
    //[self.item removeObserver:self forKeyPath:@"price"];
    NSLog(@"dealloc KVO successfully.");
}


@end