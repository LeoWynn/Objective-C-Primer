//
//  FKCar.h
//  OCLearn
//
//  Created by coreos on 3/25/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#ifndef OCLearn_FKCar_h
#define OCLearn_FKCar_h

#import <Foundation/Foundation.h>

@interface FKCar : NSObject

@property (nonatomic,copy) NSString* brand;
@property (nonatomic,copy) NSString* model;
@property (nonatomic,copy) NSString* color;

- (id) initWithBrand:(NSString*) brand model: (NSString*) model;

- (id) initWithBrand:(NSString *)brand model:(NSString *)model color:(NSString*) color;


@end

#endif
