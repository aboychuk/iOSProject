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

#import "ABMacro.h"
#import "UITableView+ABExtension.h"

static NSString * const ABNavigationBarTitle = @"Friends";

ABViewControllerRootViewProperty(ABFriendsViewController, usersView, ABFriendsView)

@interface ABFriendsViewController () <ABArrayModelObserver, ABModelObserver>

- (void)setupNavigationBar;

@end

@implementation ABFriendsViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsersModel:(ABUsersModel *)usersModel {
    if  (_usersModel != usersModel) {
        [_usersModel removeObserver:self];
        
        _usersModel = usersModel;
        [_usersModel addObserver:self];
        
        [_usersModel loadModel];
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
    return self.usersModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ABUserCell *cell = [tableView reusableCellWithClass:[ABUserCell class]];
    cell.user = self.usersModel[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)setupNavigationBar {
    UINavigationItem *navigationItem = self.navigationItem;
    navigationItem.title = ABNavigationBarTitle;
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelWillLoad:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.usersView.loadingView.visible = YES;
    });
}

- (void)modelDidLoad:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.usersView.loadingView.visible = NO;
        [self.usersView.tableView reloadData];
    });
}

- (void)modelDidFailLoading:(id)model {
    ABDispatchAsyncOnMainThread(^{
        self.usersView.loadingView.visible = NO;
    });
}

@end
