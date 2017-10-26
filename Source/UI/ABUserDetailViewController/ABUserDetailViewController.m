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
#import "ABFBGetUserContext.h"
#import "ABFBGetFriendsContext.h"

ABViewControllerRootViewProperty(ABUserDetailViewController, rootView, ABUserDetailView);

@interface ABUserDetailViewController ()
@property (nonatomic, readonly) ABFBUser  *user;

- (void)prepareNavigationItem;
- (void)showFriendsViewController;

@end

@implementation ABUserDetailViewController

#pragma mark -
#pragma mark Accessors

- (ABFBUser *)user {
    return (ABFBUser *)self.model;
}

#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    [self showFriendsViewController];
}

- (IBAction)onLogout:(UIButton *)sender {
    self.context = [[ABFBLogoutContext alloc] initWithModel:[ABFBCurrentUser sharedCurrentUser]];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareNavigationItem];
    self.context = [[ABFBGetUserContext alloc] initWithModel:self.model];
}

#pragma mark -
#pragma mark Overriden Methods

- (void)updateViewWithModel:(ABFBUser *)model {
    [self.rootView fillWithModel:model];
}

#pragma mark -
#pragma mark Private

- (void)prepareNavigationItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout"
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(onLogout:)];
}

- (void)showFriendsViewController {
    ABUsersModel *friends = self.user.friends;
    ABFriendsViewController *friendController = [ABFriendsViewController new];
    friendController.model = friends;
    
    [self.navigationController pushViewController:friendController animated:YES];
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelDidUnloaded:(id)model {
    ABWeakify(self);
    ABDispatchAsyncOnMainThread(^{
        ABStrongifyAndReturnIfNil(self);
        self.rootView.loadingView.visible = NO;
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    });
}

@end
