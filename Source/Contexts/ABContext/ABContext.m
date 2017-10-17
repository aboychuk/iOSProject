//
//  ABContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABContext.h"

#import "ABModel.h"

#import "ABMacro.h"

@interface ABContext ()
@property (nonatomic, strong)   ABModel *model;

@end

@implementation ABContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(ABModel *)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
}

- (instancetype)initWithModel:(ABModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

#pragma mark - 
#pragma mark Public Methods

- (void)execute {
    ABWeakify(self);
    [self executeWithCompletionHandler:^(NSUInteger modelState) {
        ABStrongifyAndReturnIfNil(self);
        self.model.state = modelState;
    }];
}

- (void)executeWithCompletionHandler:(ABContextCompletionHandler)handler {
    
}

- (void)cancel {
    
}

@end
