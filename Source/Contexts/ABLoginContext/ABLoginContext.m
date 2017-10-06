//
//  ABLoginContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABLoginContext.h"

#import "ABUserDetailContext.h"

static NSString *const ABPublicProfile = @"public_profile";
static NSString *const ABUserFriends = @"user_friends";

@interface ABLoginContext ()
@property (nonatomic, strong)   FBSDKLoginManager   *loginManager;
@property (nonatomic, strong)   ABUserDetailContext *context;

@end

@implementation ABLoginContext

#pragma mark -
#pragma mark Accessors

- (void)setContext:(ABUserDetailContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [context execute];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions:@[ABPublicProfile, ABUserFriends]
                 fromViewController:nil
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"Cancelled");
                                } else {
                                    NSLog(@"Logged in");
                                    self.context = [[ABUserDetailContext alloc] initWithModel:self.model];
                                }
                            }];
    self.loginManager = login;
   }

- (void)cancel {
    [self.loginManager logOut];
}

@end
