//
//  ABFBGetFriendsContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBGetFriendsContext.h"

#import "ABUser.h"
#import "ABUsersModel.h"
#import "ABFBParser.h"

#import "ABMacro.h"

static NSString *const ABFields         = @"fields";
static NSString *const ABFieldsKeys     = @"friends{first_name,last_name,picture}";
static NSString *const ABPlistName       = @"UserFriends.plist";

@interface ABFBGetFriendsContext ()
@property (nonatomic, strong)   ABUsersModel    *users;

@end

@implementation ABFBGetFriendsContext

@dynamic graphPath;
@dynamic parameters;
@dynamic plistName;
@dynamic users;

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return [FBSDKAccessToken currentAccessToken].userID;
}

- (NSDictionary *)parameters {
    return @{ABFields : ABFieldsKeys };
}

- (NSString *)plistName {
    return ABPlistName;
}

- (ABUsersModel *)users {
    return self.model;
}

#pragma mark -
#pragma mark Public Methods

- (void)parseResult:(id)result {
    ABFBParser *parser = [[ABFBParser alloc] initWithResult:result];
    ABUsersModel *friends = self.users;
    [friends addObjects:parser.friends];
}

@end
