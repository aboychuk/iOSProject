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

@interface ABModel ()

- (void)processLoading;

@end

@implementation ABModel

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        NSUInteger state = self.state;
        if (ABModelLoading == state || ABModelLoaded == state) {
            [self notifyOfState:state];
            return;
        }
        self.state = ABModelLoading;
    }

    [self processLoading];
}

- (void)performLoading {
    
}

#pragma mark -
#pragma mark Private

- (void)processLoading {
    ABWeakify(self);
    ABDispatchAsyncInBackgroundThread(^{
        ABStrongifyAndReturnIfNil(self);
        [self performLoading];
    });
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABModelLoading:
            return @selector(modelWillLoad:);
        case ABModelLoaded:
            return @selector(modelDidLoad:);
        case ABModelUnloaded:
            return @selector(modelDidUnloaded:);
        case ABModelLoadingFailed:
            return @selector(modelDidFailLoading:);
    }
    
    return [super selectorForState:state];
}

@end
