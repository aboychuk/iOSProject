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
    self.user = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ABUser *)user {
    if (_user != user) {
        [_user removeObserver:self];
        
        _user = user;
        [_user addObserver:self];
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
