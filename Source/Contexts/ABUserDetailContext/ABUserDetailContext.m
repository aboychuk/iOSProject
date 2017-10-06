//
//  ABUserDetailContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserDetailContext.h"

#import "ABUser.h"

static NSString *const ABUserID         = @"id";
static NSString *const ABUserName       = @"first_name";
static NSString *const ABUserSurname    = @"last_name";
static NSString *const ABUserCity       = @"hometown";
static NSString *const ABPictureURL     = @"picture.data.url";

@interface ABUserDetailContext ()
@property (nonatomic, readonly) ABUser  *user;

@end

@implementation ABUserDetailContext

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
            self.user.state = ABModelDidLoad;
        }
    }];
}

- (void)parseResult:(id)result {
    self.user.userID = [result valueForKeyPath:ABUserID];
    self.user.name = [result valueForKeyPath:ABUserName];
    self.user.surname = [result valueForKeyPath:ABUserSurname];
    self.user.hometown  = [result valueForKeyPath:ABUserCity];
    self.user.imageUrl = [result valueForKeyPath:ABPictureURL];
}

@end
