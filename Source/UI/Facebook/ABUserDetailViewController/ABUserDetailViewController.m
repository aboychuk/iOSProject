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
#import "ABFBLogoutContext.h"
#import "ABLoginViewController.h"
#import "ABFriendsViewController.h"
#import "ABFBFriendsContext.h"

#import "ABGCDExtension.h"
#import "ABMacro.h"

ABViewControllerRootViewProperty(ABUserDetailViewController, rootView, ABUserDetailView);

@implementation ABUserDetailViewController


#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    self.context = [[ABFBFriendsContext alloc] initWithModel:self.user];
    [self showFriendsViewController];
}

- (IBAction)onLogout:(UIButton *)sender {
    self.context = [ABFBLogoutContext new];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.user.isAuthorized) {
        [self.rootView fillWithModel:self.user];
    }
}

#pragma mark -
#pragma mark Private

- (void)showFriendsViewController {
    ABFriendsViewController *friendsController = [ABFriendsViewController new];
    friendsController.user = self.user;
    
    [self.navigationController pushViewController:friendsController animated:YES];
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelDidLoad:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.rootView.loadingView.visible = NO;
        [self.rootView fillWithModel:model];
    });
}

@end
