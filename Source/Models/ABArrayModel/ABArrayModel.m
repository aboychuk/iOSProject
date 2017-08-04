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
    [self addObject:object atIndex:self.count];
}

- (void)addObjects:(id)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)addObject:(id)object atIndex:(NSUInteger)index {
    @synchronized (self) {
        if (object) {
            if (index < self.count) {
                [self.mutableObjects insertObject:object atIndex:index];
                [self notifyOfState:ABArrayModelObjectAdded];
            }
        }
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        [self.mutableObjects removeObject:object];
        [self notifyOfState:ABArrayModelObjectRemoved];
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
            [self notifyOfState:ABArrayModelObjectRemoved];
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
        [self notifyOfState:ABArrayModelObjectMoved];
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
            return @selector(arrayModelObjectAdded:);
        case ABArrayModelObjectRemoved:
            return @selector(arrayModelObjectRemoved:);
        case ABArrayModelObjectMoved:
            return @selector(arrayModelObjectMoved:);
    }
    
    return nil;
}


@end
