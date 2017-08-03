//
//  ABArrayModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModel.h"

@interface ABArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableObjects;

@end

@implementation ABArrayModel

@dynamic count;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray new];
    }
    
    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray arrayWithArray:objects];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    @synchronized (self) {
        return self.mutableObjects.count;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object {
    @synchronized (self) {
        if (object) {
            [self.mutableObjects addObject:object];
        }
    }
}

- (void)addObjects:(id)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)addObject:(id)object atIndex:(NSUInteger)index {
    @synchronized (self) {
        if (index < self.count) {
            [self.mutableObjects insertObject:object atIndex:index];
        }
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        [self.mutableObjects removeObject:object];
    }
}

- (void)removeObjects:(id)objects {
    for (id object in objects) {
        [self removeObject:object];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        if (index < self.count) {
            [self.mutableObjects removeObjectAtIndex:index];
        }
    }
}

- (void)moveObjectFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    if (sourceIndex == destinationIndex) {
        return;
    }
    @synchronized (self) {
        id object = [self.mutableObjects objectAtIndex:sourceIndex];
        [self.mutableObjects removeObjectAtIndex:sourceIndex];
        [self.mutableObjects insertObject:object atIndex:destinationIndex];
    }
}

- (id)objectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        if (index < self.count) {
            return self.mutableObjects[index];
        }
    }
    
    return nil;
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndex:index];
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABArrayModelObjectAdded:
            return @selector(arrayModelObjectAdded: withModelChange:);
            
        case ABArrayModelObjectRemoved:
            return @selector(arrayModelObjectRemoved: withModelChange:);
            
        case ABArrayModelObjectMoved:
            return @selector(arrayModelObjectMoved: withModelChange:);
    }
    
    return nil;
}


@end
