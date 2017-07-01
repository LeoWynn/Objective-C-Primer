//
//  FKPrinter.m
//  OCLearn
//
//  Created by coreos on 4/13/17.
//  Copyright © 2017 Leo Wen. All rights reserved.
//

#import "FKPrinter.h"
#define MAX_CACHE_LINE 10

@implementation FKPrinter
{
    //定义私有成员变量
    NSString* printData[MAX_CACHE_LINE];    //使用NSString数组记录所有需要缓冲的打印数据
    int dataNum;    //记录当前需打印的作业数
}

- (void) output
{
    while (dataNum > 0) {
        NSLog(@"打印机使用%@打印：%@\n", self.printColor, printData[0]);
        dataNum--;
        for (int i= 0; i<dataNum; i++) {
            printData[i] = printData[i + 1];
        }
    }
}

- (void) addData:(NSString *)msg
{
    if (dataNum >= MAX_CACHE_LINE) {
        NSLog(@"输出队列已满，添加失败");
    }
    else
    {
        printData[dataNum++] = msg;
    }
}

- (NSDate*) getProduceTime
{
    return [[NSDate alloc]init];
}

- (NSString*) printColor
{
    return @"红色";
}
@end
