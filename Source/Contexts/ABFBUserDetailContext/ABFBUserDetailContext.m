//
//  ABFBUserDetailContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBUserDetailContext.h"

#import "ABUser.h"
#import "ABFBParser.h"

#import "ABMacro.h"

static NSString *const ABFields         = @"fields";
static NSString *const ABFieldsKeys     = @"first_name,last_name,picture.type(large)";
static NSString *const ABPlistName       = @"UserDetail.plist";

@implementation ABFBUserDetailContext

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
    ABUser *user = self.user;
    ABFBParser *parser = [[ABFBParser alloc] initWithResult:result];
    
    user.userID = parser.userID;
    user.name = parser.name;
    user.surname = parser.surname;
    user.imageUrl = parser.imageUrl;
}

@end
