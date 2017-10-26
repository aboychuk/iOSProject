//
//  ABFriendsViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFriendsViewController.h"

#import "ABFriendsView.h"
#import "ABUserCell.h"
#import "ABUsersModel.h"
#import "ABUserDetailViewController.h"
#import "ABArrayModelChange.h"
#import "ABFBGetUserContext.h"
#import "ABFBGetFriendsContext.h"

#import "UITableView+ABExtension.h"

static NSString * const ABNavigationBarTitle = @"Friends";

ABViewControllerRootViewProperty(ABFriendsViewController, rootView, ABFriendsView)

@interface ABFriendsViewController () <ABArrayModelObserver, ABModelObserver>

- (void)setupNavigationBar;

@end

@implementation ABFriendsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.context = [[ABFBGetFriendsContext alloc] initWithModel:self.model];
}

#pragma mark -
#pragma mark Overriden Methods.

- (void)fillWithModel:(ABModel *)model {
    [self.rootView fillWithModel];
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
    
    ABFBGetUserContext *context = [[ABFBGetUserContext alloc] initWithModel:user];
    
    userDetailViewController.model = user;
    userDetailViewController.context = context;
    
    [self.navigationController pushViewController:userDetailViewController animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    self.navigationItem.title = ABNavigationBarTitle;
}

@end
