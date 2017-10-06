//
//  ABFriendsContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFriendsContext.h"

#import "ABUser.h"

@interface ABFriendsContext ()
@property (nonatomic, strong)   ABUser  *user;

@end

@implementation ABFriendsContext

#pragma mark -
#pragma mark Accessors

- (ABUser *)user {
    return self.model;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    NSDictionary *parameters = @{@"fields" : @"first_name,last_name,hometown,picture.type(large)"};
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.model
                                                                   parameters:parameters];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            [self parseResult:result];
        }
    }];
}

- (void)parseResult:(id)result {

    self.user.state = ABModelDidLoad;
}
@end
