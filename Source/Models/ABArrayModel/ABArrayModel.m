//
//  ABArrayModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModel.h"

@interface ABArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableArray;

@end

@implementation ABArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableArray = [NSMutableArray new];
    }
    
    return self;
}


#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object {
    [self.mutableArray addObject:object];
}

- (void)addObjects:(id)objects {

}

- (void)addObject:(id)object atIndex:(NSUInteger)index {
    
}

- (void)removeObject:(id)object {
    
}

- (void)removeObjects:(id)objects {
    
}

- (void)removeObject:(id)object atIndex:(NSUInteger)index {
    
}

- (id)objectAtIndex:(NSUInteger)index {
    
}

@end
