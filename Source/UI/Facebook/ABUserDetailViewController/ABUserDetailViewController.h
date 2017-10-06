//
//  ABUserDetailViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABUser;
@class ABContext;

@interface ABUserDetailViewController : UIViewController
@property (nonatomic, strong)   ABUser      *user;
@property (nonatomic, strong)   ABContext   *context;

- (IBAction)onFriends:(UIButton *)sender;
- (IBAction)onLogout:(UIButton *)sender;

@end
