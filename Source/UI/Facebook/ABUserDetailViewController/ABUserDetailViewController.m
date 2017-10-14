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
#import "ABUsersModel.h"
#import "ABFBLogoutContext.h"
#import "ABLoginViewController.h"
#import "ABFriendsViewController.h"
#import "ABFBFriendsContext.h"
#import "ABFBUserDetailContext.h"

#import "ABGCDExtension.h"
#import "ABMacro.h"

ABViewControllerRootViewProperty(ABUserDetailViewController, rootView, ABUserDetailView);

@implementation ABUserDetailViewController

#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    [self showFriendsViewController];
}

- (IBAction)onLogout:(UIButton *)sender {
    self.context = [ABFBLogoutContext new];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.user.isAuthorized) {
        [self.rootView fillWithModel:self.user];
    } else {
        self.context = [[ABFBUserDetailContext alloc] initWithModel:self.user];
    }
}

#pragma mark -
#pragma mark Private

- (void)showFriendsViewController {
    ABUser *user = self.user;
    
    ABFriendsViewController *friendsController = [ABFriendsViewController new];
    friendsController.user = user;
    friendsController.context = [[ABFBFriendsContext alloc] initWithModel:user];
    
    [self.navigationController pushViewController:friendsController animated:YES];
}

@end
