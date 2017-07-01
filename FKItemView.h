//
//  FKItemView.h
//  OCLearn
//
//  Created by coreos on 3/25/17.
//  Copyright (c) 2017 Leo Wen. All rights reserved.
//

#ifndef OCLearn_FKItemView_h
#define OCLearn_FKItemView_h

#import "FKItem.h"
#import <Foundation/Foundation.h>

@interface FKItemView : NSObject

@property (nonatomic,strong) NSString* item;
- (void) showItemInfo;


@end

#endif
