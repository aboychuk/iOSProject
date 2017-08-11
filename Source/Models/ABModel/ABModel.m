//
//  ABModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/10/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABModel.h"

#import "ABGCDExtension.h"
#import "ABMacro.h"

@implementation ABModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        NSUInteger state = self.state;
        if (ABModelLoading == state) {
            return;
        }
        
        if (ABModelLoaded == state) {
            [self notifyOfState:state];
            return;
        }
        state = ABModelLoading;
    }

    [self processLoading];
}

- (void)processLoadingInBackground {
    
}

#pragma mark -
#pragma mark Private

- (void)processLoading {
    ABWeakify(self);
    ABDispatchAsyncInBackgroundThread(^{
        ABStrongifyAndReturnIfNil(self);
        [self processLoadingInBackground];
    });
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABModelLoading:
            return @selector(modelLoading:);
        case ABModelLoaded:
            return @selector(modelDidLoad:);
        case ABModelUnloaded:
            return @selector(modelUnloaded:);
        case ABModelLoadingFailed:
            return @selector(modelLoadingFailed:);
    }
    
    return nil;
}

@end
