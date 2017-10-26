//
//  ABContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ABContextCompletionHandler)(NSUInteger modelState);

@class ABModel;

@interface ABContext : NSObject
@property (nonatomic, readonly)   id  model;

+ (instancetype)contextWithModel:(ABModel *)model;

- (instancetype)initWithModel:(ABModel *)model;

//Methods Created for overriding, do not call directly
- (void)execute;
- (void)executeWithCompletionHandler:(ABContextCompletionHandler)handler;
- (void)cancel;

@end
