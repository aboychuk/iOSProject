//
//  ABSharedCache.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSharedCache.h"

@interface ABSharedCache ()
@property (nonatomic, strong)   NSMapTable  *cachedObjects;

@end

@implementation ABSharedCache

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedCache {
    static ABSharedCache *sharedCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCache = [[self alloc] init];
    });
    
    return sharedCache;
}

#pragma mark -
#pragma mark Initialiazations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cachedObjects = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Public

- (void)addObject:(id)object forKey:(id)key {
    @synchronized (self) {
        [self.cachedObjects setObject:object forKey:key];
    }
}

- (void)removeObjectforKey:(id)key {
    @synchronized (self) {
        [self.cachedObjects removeObjectForKey:key];
    }
}

- (id)objectForKey:(id)key {
    @synchronized (self) {
        return [self.cachedObjects objectForKey:key];
    }
}

@end
