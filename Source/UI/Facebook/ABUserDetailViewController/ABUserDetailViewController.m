//
//  ABUserDetailViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ABUserDetailViewController.h"

@interface ABUserDetailViewController ()

- (void)logout;

@end

@implementation ABUserDetailViewController

#pragma mark -
#pragma mark Actions

- (IBAction)onFriends:(UIButton *)sender {
    
}

- (IBAction)onLogout:(UIButton *)sender {
    [self logout];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Private

- (void)logout {
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
}

@end
