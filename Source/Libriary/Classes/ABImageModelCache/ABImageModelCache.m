//
//  ABImageModelCache.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABImageModelCache.h"
#import "ABImageModel.h"

@interface ABImageModelCache ()
@property (nonatomic, strong)   NSMapTable  *cachedObjects;

@end

@implementation ABImageModelCache

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedCache {
    static ABImageModelCache *sharedCache = nil;
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

- (void)addModel:(id)model forKey:(id)key {
    @synchronized (self) {
        [self.cachedObjects setObject:model forKey:key];
    }
}

- (void)removeModelForKey:(id)key {
    @synchronized (self) {
        [self.cachedObjects removeObjectForKey:key];
    }
}

- (id)modelForKey:(id)key {
    @synchronized (self) {
        return [self.cachedObjects objectForKey:key];
    }
}

@end
