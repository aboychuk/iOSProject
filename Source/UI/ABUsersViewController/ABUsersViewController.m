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
#import "ABLoadingView.h"
#import "ABUsersModel.h"

#import "ABMacro.h"
#import "UITableView+ABExtension.h"

static NSString * const ABNavigationBarTitle = @"Users";

ABViewControllerRootViewProperty(ABUsersViewController, usersView, ABUsersView)

@interface ABUsersViewController () <ABArrayModelObserver, ABModelObserver>

- (void)setupNavigationBar;

@end

@implementation ABUsersViewController

#pragma mark -
#pragma mark Accessors

- (void)setUsersModel:(ABUsersModel *)usersModel {
    if  (_usersModel != usersModel) {
        [_usersModel removeObserver:self];
        
        _usersModel = usersModel;
        [_usersModel addObserver:self];
        
        [self.usersModel load];
    }
}

#pragma mark -
#pragma mark Actions

- (void)onEdit:(UIBarButtonItem *)sender {
    UITableView *tableView = self.usersView.tableView;
    BOOL isEditing = self.usersView.tableView.editing;
    
    [tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem systemItem = !isEditing ? UIBarButtonSystemItemDone : UIBarButtonSystemItemEdit;
    
    UIBarButtonItem *editButton = [self editButtonWithButtonSystemItem:systemItem];
    self.navigationItem.rightBarButtonItem = editButton;
}

- (void)onAdd:(UIBarButtonItem *)sender {
    [self.usersModel insertObject:[ABUser new] atIndex:0];
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [self.usersModel removeObjectAtIndex:indexPath.row];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.usersModel moveObjectFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
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
    
    UIBarButtonItem *editButton = [self editButtonWithButtonSystemItem:UIBarButtonSystemItemEdit];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(onAdd:)];
    navigationItem.rightBarButtonItem = editButton;
    navigationItem.leftBarButtonItem = addButton;
}

- (UIBarButtonItem *)editButtonWithButtonSystemItem:(UIBarButtonSystemItem)systemItem {
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem
                                                                                target:self
                                                                                action:@selector(onEdit:)];
    return editButton;
}

#pragma mark -
#pragma mark ABArrayModelObserver

- (void)arrayModel:(ABArrayModel *)arrayModel didChangeWithArrayModelChange:(ABArrayModelChange *)changeModel {
    [self.usersView.tableView applyModel:changeModel];
}

#pragma mark -
#pragma mark ABModelObserver

#pragma mark -
#pragma mark ABModelObserver

- (void)modelDidLoad:(id)model {
    [self.usersView.tableView reloadData];
}

@end
