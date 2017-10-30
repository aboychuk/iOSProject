//
//  ABFBCurrentUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/26/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBCurrentUser.h"

@implementation ABFBCurrentUser

@dynamic authorized;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedCurrentUser {
    static ABFBCurrentUser *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[self alloc] init];
    });
    
    return user;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isAuthorized {
    return [self.token isEqualToString:[FBSDKAccessToken currentAccessToken].tokenString];
}

@end
