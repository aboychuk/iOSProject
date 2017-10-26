//
//  ABFBLoginContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBLoginContext.h"

#import "ABFBGetUserContext.h"

#import "ABMacro.h"

static NSString *const ABPublicProfile = @"public_profile";
static NSString *const ABUserFriends = @"user_friends";

@implementation ABFBLoginContext

@dynamic user;

#pragma mark -
#pragma mark Accessors

- (ABUser *)user {
    return self.model;
}

#pragma mark -
#pragma mark Public Methods

- (void)executeWithCompletionHandler:(ABContextCompletionHandler)handler {
    __block NSUInteger state = self.user.state;
    if (self.user.isAuthorized) {
        state = ABModelDidLoad;
        return;
    } else {
    FBSDKLoginManager *login = [FBSDKLoginManager new];
    ABWeakify(self);
    [login logInWithReadPermissions:@[ABPublicProfile, ABUserFriends]
                 fromViewController:nil
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                ABStrongifyAndReturnIfNil(self);
                                if (!(error && result.isCancelled)) {
                                    self.user.token = [FBSDKAccessToken currentAccessToken].tokenString;
                                    state = ABModelWillLoad;
                                    handler(state);
                                }
                            }];
    }
}

@end
