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
#pragma mark Accessors

- (BOOL)isAuthorized {
    return [self.token isEqualToString:[FBSDKAccessToken currentAccessToken].tokenString];
}

@end
