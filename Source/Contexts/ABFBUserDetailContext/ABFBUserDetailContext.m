//
//  ABFBUserDetailContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBUserDetailContext.h"

#import "ABUser.h"

static NSString *const ABUserID         = @"id";
static NSString *const ABUserName       = @"first_name";
static NSString *const ABUserSurname    = @"last_name";
static NSString *const ABUserCity       = @"hometown";
static NSString *const ABPictureURL     = @"picture.data.url";
static NSString *const ABFields         = @"fields";
static NSString *const ABFieldsKeys     = @"first_name,last_name,hometown,picture.type(large)";

@implementation ABFBUserDetailContext

#pragma mark - 
#pragma mark Public Methods

- (void)execute {
    NSDictionary *parameters = @{ABFields : ABFieldsKeys};
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.fbUser.userID
                                                                   parameters:parameters];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            [self parseResult:result];
            self.fbUser.state = ABModelDidLoad;
        }
    }];
}

- (void)parseResult:(id)result {
    ABUser *user = self.fbUser;
    
    user.userID = [result valueForKeyPath:ABUserID];
    user.name = [result valueForKeyPath:ABUserName];
    user.surname = [result valueForKeyPath:ABUserSurname];
    user.hometown  = [result valueForKeyPath:ABUserCity];
    user.imageUrl = [result valueForKeyPath:ABPictureURL];
}

@end
