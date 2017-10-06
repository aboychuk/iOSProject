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
#import "ABLogoutContext.h"
#import "ABLoginViewController.h"

#import "ABGCDExtension.h"
#import "ABMacro.h"

ABViewControllerRootViewProperty(ABUserDetailViewController, rootView, ABUserDetailView);

@implementation ABUserDetailViewController

#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    
}

- (IBAction)onLogout:(UIButton *)sender {
    self.context = [ABLogoutContext new];
    [self.navigationController pushViewController:[ABLoginViewController new] animated:YES];


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
