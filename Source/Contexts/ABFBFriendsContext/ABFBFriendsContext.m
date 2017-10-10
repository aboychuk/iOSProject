//
//  ABFBFriendsContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBFriendsContext.h"

#import "ABUser.h"
#import "ABUsersModel.h"

static NSString *const ABUserID         = @"userID";
static NSString *const ABUserName       = @"first_name";
static NSString *const ABUserSurname    = @"last_name";
static NSString *const ABUserFriends    = @"friends.data";
static NSString *const ABUserPictureURL = @"picture.data.url";

@implementation ABFBFriendsContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    NSDictionary *parameters = @{@"fields" : @"friends{first_name,last_name,picture}"};
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.user.userID
                                                                   parameters:parameters];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            self.user.friends = [[ABUsersModel alloc] initWithObjects:[self parseResult:result]];
            self.user.state = ABModelDidLoad;
        }
    }];
}

- (NSArray *)parseResult:(id)result {
    NSArray *friends = [result valueForKeyPath:ABUserFriends];
    NSMutableArray *mutableFriends = [NSMutableArray arrayWithCapacity:[friends count]];
    for (id friend in friends) {
        ABUser *user = [ABUser new];
        
        user.name = [friend valueForKeyPath:ABUserName];
        user.surname = [friend valueForKeyPath:ABUserSurname];
        user.userID = [friend valueForKeyPath:ABUserID];
        user.imageUrl = [friend valueForKeyPath:ABUserPictureURL];
        
        [mutableFriends addObject:user];
    }
    
    return [mutableFriends copy];
}

@end
