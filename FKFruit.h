//
//  FKFruit.h
//  OCLearn
//
//  Created by coreos on 3/25/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#ifndef OCLearn_FKFruit_h
#define OCLearn_FKFruit_h

#import <Foundation/Foundation.h>

@interface FKFruit : NSObject

@property (nonatomic, assign) NSString* color;
@property (nonatomic, assign) int size;
@property (nonatomic, assign) double weight;
- (void) info;

@end

#endif
