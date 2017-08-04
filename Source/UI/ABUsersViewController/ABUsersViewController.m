//
//  ABUsersViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUsersViewController.h"

#import "ABUser.h"
#import "ABUsersView.h"
#import "ABUserCell.h"
#import "ABArrayModel.h"

#import "ABMacro.h"
#import "UITableView+ABExtension.h"

ABViewControllerRootViewProperty(ABUsersViewController, usersView, ABUsersView)

@interface ABUsersViewController () <ABArrayModelObserver>

@end

@implementation ABUsersViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(ABArrayModel *)users {
    if  (_users != users) {
        [_users removeObserver:self];
        
        _users = users;
        [_users addObserver:self];
    }
}

#pragma mark
#pragma mark - Actions

- (void)onEdit:(UIBarButtonItem *)sender {
    BOOL isEditing = self.usersView.tableView.editing;
    [self.usersView.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = !isEditing ? UIBarButtonSystemItemDone : UIBarButtonSystemItemEdit;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(onEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;

    [self.usersView.tableView reloadData];
}

- (void)onAdd:(UIBarButtonItem *)sender {
    [self.users addObject:[ABUser new] atIndex:0];
    [self.usersView.tableView reloadData];
    
}

#pragma mark
#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Users";
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                target:self
                                                                                action:@selector(onEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(onAdd:)];
    self.navigationItem.leftBarButtonItem = addButton;
}

#pragma mark
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ABUserCell *cell = [tableView reusableCellWithClass:[ABUserCell class]];
    cell.user = self.users[indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        NSLog(@"delete");
        [self.users removeObjectAtIndex:indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
      toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark
#pragma mark - ABArrayModelObserver

- (void)arrayModelObjectAdded:(ABArrayModel *)arrayModel {
    [self.usersView.tableView reloadData];
}

- (void)arrayModelObjectRemoved:(ABArrayModel *)arrayModel {
    [self.usersView.tableView reloadData];

}

- (void)arrayModelObjectMoved:(ABArrayModel *)arrayModel {
    [self.usersView.tableView reloadData];

}

@end
