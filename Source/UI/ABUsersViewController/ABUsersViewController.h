//
//  ABUsersViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABArrayModel;
@class ABUsersModel;

@interface ABUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   ABUsersModel    *users;

- (void)onEdit:(UIBarButtonItem *)sender;
- (void)onAdd:(UIBarButtonItem *)sender;

@end
