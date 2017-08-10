//
//  ABArrayModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModel.h"

#import "NSMutableArray+ABExtension.h"

static NSString * const ABPlistName = @"arrayModelData.plist";

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
    [self insertObject:object atIndex:self.count];
}

- (void)addObjects:(id)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    @synchronized (self) {
        if (object) {
            if (index < self.count) {
                [self.mutableObjects insertObject:object atIndex:index];
                [self notifyOfState:ABArrayModelObjectChanged
                         withObject:[ABArrayModelChange modelChangeAddWithIndex:index]];
            }
        }
    }
}

- (void)removeObject:(id)object {
    [self removeObjectAtIndex:[self indexOfObject:object]];
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
            [self notifyOfState:ABArrayModelObjectChanged
                     withObject:[ABArrayModelChange modelChangeDeleteWithIndex:index]];
        }
    }
}

- (void)moveObjectFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        [self.mutableObjects moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
        [self notifyOfState:ABArrayModelObjectChanged
                 withObject:[ABArrayModelChange modelChangeMoveAtIndex:sourceIndex
                                                               toIndex:destinationIndex]];
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

- (NSUInteger)indexOfObject:(id)object {
    return [self.mutableObjects indexOfObject:object];
}

- (void)saveData {
    [NSKeyedArchiver archiveRootObject:self.mutableObjects toFile:[self savePath]];
}

- (void)loadData {
    self.mutableObjects = [NSKeyedUnarchiver unarchiveObjectWithFile:[self savePath]];

}

#pragma mark -
#pragma mark Private

- (NSString *)savePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *savePath = [paths firstObject];
    
    return [savePath stringByAppendingPathComponent:ABPlistName];
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABArrayModelObjectChanged:
            return @selector(arrayModel:didChangeWithArrayModelChange:);
    }
    
    return nil;
}

@end
