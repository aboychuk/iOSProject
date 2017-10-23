//
//  ABFBViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/10/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBViewController.h"

#import "ABView.h"

#import "ABMacro.h"
#import "ABGCDExtension.h"

ABViewControllerRootViewProperty(ABFBViewController, rootView, ABView)

@implementation ABFBViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ABModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
    }
}

- (void)setContext:(ABContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [_context execute];
    }
}

#pragma mark -
#pragma mark Overriden Methods

- (void)fillWithModel:(ABModel *)model {
    
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelWillLoad:(id)model {
    ABWeakify(self);
    ABDispatchAsyncOnMainThread(^{
        ABStrongifyAndReturnIfNil(self);
        self.rootView.loadingView.visible = YES;
    });
}

- (void)modelDidLoad:(id)model {
    ABWeakify(self);
    ABDispatchAsyncOnMainThread(^{
        ABStrongifyAndReturnIfNil(self);
        self.rootView.loadingView.visible = NO;
        [self.rootView fillWithModel:model];
    });
}

- (void)modelDidFailLoading:(id)model {
    ABWeakify(self);
    ABDispatchAsyncOnMainThread(^{
        ABStrongifyAndReturnIfNil(self);
        self.rootView.loadingView.visible = NO;
    });
}

@end
