//
//  ABObservableObject.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

#import "ABMacro.h"

@interface ABObservableObject ()
@property (nonatomic, retain)   NSHashTable    *mutableObserversHashTable;
@property (nonatomic, assign)   BOOL           notify;

- (void)notifyOfStateChangeWithSelector:(SEL)selector andObject:(id)object;
- (void)performBlock:(void(^)(void))block notification:(BOOL)notify;

@end

@implementation ABObservableObject

@dynamic observersSet;
@dynamic notification;

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.mutableObserversHashTable = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObserversHashTable = [NSHashTable weakObjectsHashTable];
        self.notify = YES;
    }
    
    return self;
}

#pragma mark
#pragma mark - Accesors

- (NSSet *)obsrversSet {
    @synchronized (self) {
        return [self.mutableObserversHashTable setRepresentation];
    }
}

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state != _state) {
            _state = state;
            
            [self notifyOfState:state];
        }
    }
}

- (BOOL)notification {
    return self.notify;
}

#pragma mark
#pragma mark - Public Methods

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObserversHashTable addObject:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObserversHashTable removeObject:observer];
    }
}

- (BOOL)isObservedByObject:(id)observer {
    @synchronized (self) {
        return [self.mutableObserversHashTable containsObject:observer];
    }
}

- (void)notifyOfState:(NSUInteger)state {
    [self notifyOfState:state withObject:nil];
}

- (void)notifyOfState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        if (self.notify) {
            [self notifyOfStateChangeWithSelector:[self selectorForState:state] andObject:object];
        }
    }
}

- (void)performBlockWithNotification:(ABVoidBlock)voidBlock {
    [self performBlock:voidBlock notification:YES];
}

- (void)performBlockWithoutNotification:(ABVoidBlock)voidBlock {
    [self performBlock:voidBlock notification:NO];
}


#pragma mark
#pragma mark - Private Methods

- (void)performBlock:(ABVoidBlock)block notification:(BOOL)notify {
    BOOL notification = self.notify;
    self.notify = notify;
    block();
    self.notify = notification;
}

- (SEL)selectorForState:(NSUInteger)state {
    [self doesNotRecognizeSelector:_cmd];
    
    return NULL;
}

- (void)notifyOfStateChangeWithSelector:(SEL)selector andObject:(id)object {
    NSHashTable *observersHashTable = self.mutableObserversHashTable;
    for (id observer in observersHashTable) {
        if ([observer respondsToSelector:selector]) {
            ABSelectorWarningLeakPush
            [observer performSelector:selector withObject:self withObject:object];
            ABSelectorWarningLeakPop
        }
    }
}

@end
