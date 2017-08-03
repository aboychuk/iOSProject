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

@implementation ABUsersViewController

#pragma mark
#pragma mark - Actions

- (void)onEdit:(UIBarButtonItem *)sender {
    BOOL isEditing = self.usersView.tableView.editing;
    [self.usersView.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = !isEditing
    ? UIBarButtonSystemItemDone
    : UIBarButtonSystemItemEdit;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
                                                                                target:self
                                                                                action:@selector(onEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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


@end
