//
//  ABArrayModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModel.h"

#import "ABUser.h"

#import "NSMutableArray+ABExtension.h"
#import "NSObject+ABObjectExtension.h"

static NSString * const ABPlistName     = @"arrayModelData.plist";
static const NSUInteger usersCount      = 3000;

@interface ABArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableObjects;

- (void)notifyOfStateWithModelChange:(ABArrayModelChange *)modelChange;

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
                [self notifyOfStateWithModelChange:[ABArrayModelChange modelChangeAddWithIndex:index]];
                [self.mutableObjects insertObject:object atIndex:index];
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
            [self notifyOfStateWithModelChange:[ABArrayModelChange modelChangeDeleteWithIndex:index]];
            [self.mutableObjects removeObjectAtIndex:index];
        }
    }
}

- (void)moveObjectFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        [self notifyOfStateWithModelChange:[ABArrayModelChange modelChangeMoveAtIndex:sourceIndex
                                                                              toIndex:destinationIndex]];
        [self.mutableObjects moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
    }
}

- (id)objectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        return index < self.count ? self.mutableObjects[index] : nil;
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)object {
    return [self.mutableObjects indexOfObject:object];
}

- (void)notifyOfStateWithModelChange:(ABArrayModelChange *)modelChange {
    [self notifyOfState:ABArrayModelObjectChanged withObject:modelChange];
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.mutableObjects toFile:[self savePath]];
}
- (void)processLoadingInBackground {
    NSArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:[self savePath]];
    if (users) {
        self.mutableObjects = [NSMutableArray arrayWithArray:users];
    } else {
        for (NSUInteger i = 0; i < usersCount; i++) {
            [self addObject:[ABUser new]];
        }
    }
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
