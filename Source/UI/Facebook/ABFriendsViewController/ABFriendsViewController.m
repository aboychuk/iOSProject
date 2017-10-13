//
//  ABFriendsViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFriendsViewController.h"

#import "ABUser.h"
#import "ABFriendsView.h"
#import "ABUserCell.h"
#import "ABLoadingView.h"
#import "ABUsersModel.h"
#import "ABGCDExtension.h"
#import "ABUserDetailView.h"
#import "ABUserDetailViewController.h"
#import "ABArrayModelChange.h"
#import "ABFBUserDetailContext.h"

#import "ABMacro.h"
#import "UITableView+ABExtension.h"

static NSString * const ABNavigationBarTitle = @"Friends";

ABViewControllerRootViewProperty(ABFriendsViewController, rootView, ABFriendsView)

@interface ABFriendsViewController () <ABArrayModelObserver, ABModelObserver>

- (void)setupNavigationBar;

@end

@implementation ABFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setFriends:(ABUsersModel *)friends {
    if (_friends != friends) {
        [_friends removeObserver:self];
        
        _friends = friends;
        [_friends addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ABUserCell *cell = [tableView reusableCellWithClass:[ABUserCell class]];
    cell.user = self.friends[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ABUser *user = self.friends[indexPath.row];
    ABUserDetailViewController *userDetailViewController = [ABUserDetailViewController new];
    ABFBUserDetailContext *context = [[ABFBUserDetailContext alloc] initWithModel:user];
    
    userDetailViewController.user = user;
    userDetailViewController.context = context;
    
    [self.navigationController pushViewController:userDetailViewController animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    UINavigationItem *navigationItem = self.navigationItem;
    navigationItem.title = ABNavigationBarTitle;
}

@end
