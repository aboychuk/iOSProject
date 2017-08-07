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

@end

@implementation ABObservableObject

@dynamic observersSet;

#pragma mark
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.mutableObserversHashTable = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObserversHashTable = [NSHashTable weakObjectsHashTable];
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
        [self notifyOfStateChangeWithSelector:[self selectorForState:state] andObject:nil];
    }
}

#pragma mark
#pragma mark - Private Methods

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
