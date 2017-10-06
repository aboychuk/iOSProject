//
//  ABUserDetailViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ABUserDetailViewController.h"

#import "ABUserDetailView.h"
#import "ABUser.h"

#import "ABGCDExtension.h"
#import "ABMacro.h"

@interface ABUserDetailViewController ()

- (void)logout;

@end

ABViewControllerRootViewProperty(ABUserDetailViewController, rootView, ABUserDetailView);

@implementation ABUserDetailViewController

#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    
}

- (IBAction)onLogout:(UIButton *)sender {
    
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Private

- (void)logout {
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
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
        [self.rootView fillWithModel:model];
    });
}

- (void)modelDidFailLoading:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.rootView.loadingView.visible = NO;
    });
}

@end
