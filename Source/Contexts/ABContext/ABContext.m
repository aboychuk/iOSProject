//
//  ABContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABContext.h"

@implementation ABContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(id)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
}

- (instancetype)initWithModel:(id)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark - 
#pragma mark Public Methods

- (void)execute {
    
}

- (void)cancel {
    
}

@end
