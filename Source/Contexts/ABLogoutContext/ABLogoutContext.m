//
//  ABLogoutContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//



#import "ABLogoutContext.h"

@implementation ABLogoutContext

- (void)execute {
    [[FBSDKLoginManager new] logOut];
}

@end
