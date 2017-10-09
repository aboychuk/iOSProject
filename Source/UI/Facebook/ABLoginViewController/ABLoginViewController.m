//
//  ABLoginViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABLoginViewController.h"

#import "ABLoginView.h"
#import "ABUserDetailViewController.h"
#import "ABContext.h"
#import "ABFBLoginContext.h"
#import "ABUser.h"

#import "ABMacro.h"
#import "ABGCDExtension.h"

ABViewControllerRootViewProperty(ABLoginViewController, rootView, ABLoginView)

@implementation ABLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.user = nil;
    self.context = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.user = [ABUser new];
    }
    
    return self;
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
#pragma mark Actions

- (IBAction)onLogin:(UIButton *)sender {
    self.context = [ABFBLoginContext contextWithModel:self.user];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.user.isAuthorized) {
        [self showUserDetailViewController];
    }
}

#pragma mark -
#pragma mark Private

- (void)showUserDetailViewController {
    ABUserDetailViewController *userDetailController = [ABUserDetailViewController new];
    userDetailController.user = self.user;
    
    [self.navigationController pushViewController:userDetailController animated:YES];
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelWillLoad:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.rootView.loadingView.visible = YES;
    });
}

- (void)modelDidLoad:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.rootView.loadingView.visible = NO;
        [self showUserDetailViewController];
    });
}

- (void)modelDidFailLoading:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.rootView.loadingView.visible = NO;
    });
}

@end
