//
//  FKPrintable.h
//  OCLearn
//
//  Created by coreos on 4/13/17.
//  Copyright © 2017 Leo Wen. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "FKOutput.h"
#import "FKProductable.h"

#ifndef FKPrintable_h
#define FKPrintable_h


#endif /* FKPrintable_h */

//定义协议
@protocol FKPrintable <FKOutput , FKProductable>

- (NSString*) printColor;

@end
