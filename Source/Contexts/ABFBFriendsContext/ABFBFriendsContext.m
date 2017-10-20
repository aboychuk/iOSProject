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
#import "ABFBParser.h"

#import "ABMacro.h"

static NSString *const ABFields         = @"fields";
static NSString *const ABFieldsKeys     = @"friends{first_name,last_name,picture}";
static NSString *const ABPlistName       = @"UserFriends.plist";

@implementation ABFBFriendsContext

@dynamic graphPath;
@dynamic parameters;
@dynamic plistName;

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return self.user.userID;
}

- (NSDictionary *)parameters {
    return @{ABFields : ABFieldsKeys };
}

- (NSString *)plistName {
    return ABPlistName;
}

#pragma mark -
#pragma mark Public Methods

- (void)parseResult:(id)result {
    ABFBParser *parser = [[ABFBParser alloc] initWithResult:result];
    self.user.friends = [[ABUsersModel alloc] initWithObjects:parser.friends];
}

@end
