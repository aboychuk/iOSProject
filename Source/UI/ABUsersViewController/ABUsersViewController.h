//
//  ABUsersViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ABUser;

@interface ABUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   ABUser  *user;

@end
