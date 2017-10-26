//
//  ABFBContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ABContext.h"
#import "ABFBUser.h"

@interface ABFBContext : ABContext
@property (nonatomic, strong)   ABFBUser  *user;

@end
