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

#import "ABMacro.h"

ABViewControllerRootViewProperty(ABUsersViewController, usersView, ABUsersView)

@implementation ABUsersViewController

#pragma mark
#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = self.usersView.tableView;
    
    [tableView reloadData];
    [tableView addObserver:self
                forKeyPath:@"bounds"
                   options:NSKeyValueObservingOptionNew
                   context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    CGRect bounds = self.usersView.tableView.bounds;
    
    NSLog(@"Bounds = %@", [NSValue valueWithCGRect:bounds]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * const kABCellName = @"kABCellName";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kABCellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:kABCellName];
    }
    cell.textLabel.text = self.user.fullname;
    
    return cell;
}


@end
