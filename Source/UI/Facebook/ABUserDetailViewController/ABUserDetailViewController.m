//
//  ABUserDetailViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserDetailViewController.h"

#import "ABUserDetailView.h"
#import "ABFBLogoutContext.h"
#import "ABFriendsViewController.h"
#import "ABFBGetFriendsContext.h"

ABViewControllerRootViewProperty(ABUserDetailViewController, rootView, ABUserDetailView);

@implementation ABUserDetailViewController

#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    self.context = [[ABFBGetFriendsContext alloc] initWithModel:self.user];
}

- (IBAction)onLogout:(UIButton *)sender {
    self.context = [[ABFBLogoutContext alloc] initWithModel:self.user];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootView fillWithModel:self.user];
}

#pragma mark -
#pragma mark Private

- (void)showFriendsViewController {
    ABFriendsViewController *friendsController = [ABFriendsViewController new];
    friendsController.friends = self.user.friends;
    
    [self.navigationController pushViewController:friendsController animated:YES];
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelDidUnloaded:(id)model {
    ABWeakify(self);
    ABDispatchAsyncOnMainThread(^{
        ABStrongifyAndReturnIfNil(self);
        self.rootView.loadingView.visible = NO;
        [self.navigationController popToRootViewControllerAnimated:YES];
    });
}

- (void)modelDidLoad:(id)model {
    ABWeakify(self);
    ABDispatchAsyncOnMainThread(^{
        ABStrongifyAndReturnIfNil(self);
        self.rootView.loadingView.visible = NO;
        [self showFriendsViewController];
    });
}

@end
