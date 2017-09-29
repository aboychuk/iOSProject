//
//  ABContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABContext : NSObject
@property (nonatomic, strong)   id model;

+ (instancetype)contextWithModel:(id)model;

- (void)execute;
- (void)cancel;

@end
