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
#import "ABFriendsViewController.h"
#import "ABFriendsContext.h"

#import "ABGCDExtension.h"
#import "ABMacro.h"

ABViewControllerRootViewProperty(ABUserDetailViewController, rootView, ABUserDetailView);

@implementation ABUserDetailViewController

#pragma mark -
#pragma mark Accessors

- (void)setContext:(ABContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [_context execute];
    }
}

#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    self.context = [[ABFriendsContext alloc] initWithModel:self.user];
    [self showFriendsViewController];
}

- (IBAction)onLogout:(UIButton *)sender {
    self.context = [ABLogoutContext new];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
