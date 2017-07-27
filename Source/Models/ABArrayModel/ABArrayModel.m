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
    @synchronized (self) {
        [self.mutableArray addObject:object];
    }
}

- (void)addObjects:(id)objects {
    for (id object in objects) {
        [self.mutableArray addObject:object];
    }
}

- (void)addObject:(id)object atIndex:(NSUInteger)index {
    @synchronized (self) {
        if (index < self.count) {
            [self.mutableArray insertObject:object atIndex:index];
        }
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        [self.mutableArray removeObject:object];
    }
}

- (void)removeObjects:(id)objects {
    @synchronized (self) {
        for (id object in objects) {
            [self.mutableArray removeObject:object];
        }
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        if (index < self.count) {
            [self.mutableArray removeObjectAtIndex:index];
        }
    }
}

- (id)objectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        NSMutableArray *array = self.mutableArray;
        if (index < self.count) {
            return nil;
        }
        
        return [array objectAtIndex:index];
    }
}

@end
