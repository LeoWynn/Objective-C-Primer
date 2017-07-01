//
//  FKOutput.h
//  OCLearn
//
//  Created by coreos on 4/13/17.
//  Copyright © 2017 Leo Wen. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义协议
@protocol FKOutput <NSObject>

- (void) output;
- (void) addData: (NSString*) msg;

@end

