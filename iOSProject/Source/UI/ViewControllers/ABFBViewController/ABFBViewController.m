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
    self.currentUser = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(id)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
    }
}

- (void)setCurrentUser:(ABFBCurrentUser *)currentUser {
    if (_currentUser != currentUser) {
        [_currentUser removeObserver:self];
        
        _currentUser = currentUser;
        [_currentUser addObserver:self];
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

- (void)updateViewWithModel:(id)model {
    
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
        [self updateViewWithModel:model];
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
