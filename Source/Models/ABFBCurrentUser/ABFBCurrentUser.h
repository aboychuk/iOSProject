//
//  ABFBCurrentUser.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/26/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ABFBUser.h"

@interface ABFBCurrentUser : ABFBUser
@property (nonatomic, readonly, getter=isAuthorized)    BOOL   authorized;

@property   (nonatomic, strong) NSString    *token;

@end
