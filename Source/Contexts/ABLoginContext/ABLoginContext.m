//
//  ABLoginContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABLoginContext.h"

@interface ABLoginContext ()
@property (nonatomic, strong)   FBSDKLoginManager   *loginManager;

@end

@implementation ABLoginContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[@"public_profile", @"user_friends"]
                 fromViewController:nil
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"Cancelled");
                                } else {
                                    NSLog(@"Logged in");
                                }
                            }];
    self.loginManager = login;
   }

- (void)cancel {
    [self.loginManager logOut];
}

@end
