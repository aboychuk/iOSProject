//
//  ABLoginViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ABLoginViewController.h"

#import "ABLoginView.h"
#import "ABUserDetailViewController.h"

#import "ABMacro.h"

ABViewControllerRootViewProperty(ABLoginViewController, rootView, ABLoginView)

@implementation ABLoginViewController

#pragma mark -
#pragma mark Actions

- (IBAction)onLogin:(UIButton *)sender {
    [self login];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark Private

- (void)login {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile"]
                 fromViewController:self
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"Cancelled");
                                } else {
                                    NSLog(@"Logged in");
                                }
                            }];
        if ([FBSDKAccessToken currentAccessToken]) {
        [self.navigationController pushViewController:[ABUserDetailViewController new] animated:YES];
    }
}

@end
