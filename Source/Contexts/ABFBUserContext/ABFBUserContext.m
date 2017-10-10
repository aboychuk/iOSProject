//
//  ABFBUserContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBUserContext.h"

#import "ABUser.h"

@implementation ABFBUserContext

#pragma mark -
#pragma mark Accessors

- (ABUser *)user {
    return self.model;
}

#pragma mark -
#pragma mark Public Methods

- (void)cancel {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    [loginManager logOut];
}

@end
