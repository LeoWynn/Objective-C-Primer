//
//  NSNumber_category.m
//  OCLearn
//
//  Created by coreos on 4/13/17.
//  Copyright © 2017 Leo Wen. All rights reserved.
//

#import "NSNumber_category.h"

@implementation NSNumber (fk)

- (NSNumber*) add: (double) num2
{
    return [NSNumber numberWithDouble:([self doubleValue] + num2)];
}
- (NSNumber*) substract: (double) num2
{
    return [NSNumber numberWithDouble:([self doubleValue] - num2)];
}
- (NSNumber*) multiply: (double) num2
{
    return [NSNumber numberWithDouble:([self doubleValue] * num2)];
}
- (NSNumber*) divide: (double) num2
{
    return [NSNumber numberWithDouble:([self doubleValue] / num2)];
}

@end
