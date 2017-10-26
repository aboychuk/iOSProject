//
//  ABUserDetailViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBViewController.h"

@class ABUser;
@class ABContext;

@interface ABUserDetailViewController : ABFBViewController

- (IBAction)onFriends:(UIButton *)sender;
- (IBAction)onLogout:(UIButton *)sender;

@end
