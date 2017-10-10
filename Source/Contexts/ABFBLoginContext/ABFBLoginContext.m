//
//  ABFBLoginContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBLoginContext.h"

#import "ABFBUserDetailContext.h"

static NSString *const ABPublicProfile = @"public_profile";
static NSString *const ABUserFriends = @"user_friends";

@interface ABFBLoginContext ()
@property (nonatomic, strong)   ABFBUserDetailContext *context;

@end

@implementation ABFBLoginContext

#pragma mark -
#pragma mark Accessors

- (void)setContext:(ABFBUserDetailContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [context execute];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    if (self.user.isAuthorized) {
        [self loadContext];
    }
    FBSDKLoginManager *login = [FBSDKLoginManager new];
    [login logInWithReadPermissions:@[ABPublicProfile, ABUserFriends]
                 fromViewController:nil
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (!(error && result.isCancelled)) {
                                    self.user.userID = [FBSDKAccessToken currentAccessToken].userID;
                                    [self loadContext];
                                }
                            }];
}

- (void)loadContext {
    self.context = [[ABFBUserDetailContext alloc] initWithModel:self.model];
}

@end
