//
//  ABFriendsViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABArrayModel;
@class ABUsersModel;
@class ABUser;

@interface ABFriendsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   ABUsersModel    *friends;
@property (nonatomic, strong)   ABUser          *user;

@end
