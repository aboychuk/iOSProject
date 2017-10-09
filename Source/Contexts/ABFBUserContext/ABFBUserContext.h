//
//  ABFBUserContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ABContext.h"

@class ABUser;

@interface ABFBUserContext : ABContext
@property (nonatomic, strong)   ABUser  *fbUser;

@end
