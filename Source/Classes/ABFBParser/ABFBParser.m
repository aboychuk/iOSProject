//
//  ABFBParser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/13/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBParser.h"

#import "ABUser.h"

static NSString *const ABUserID         = @"id";
static NSString *const ABUserName       = @"first_name";
static NSString *const ABUserSurname    = @"last_name";
static NSString *const ABPictureURL     = @"picture.data.url";
static NSString *const ABUserFriends    = @"friends.data";

@interface ABFBParser ()
@property (nonatomic, strong)   id  result;

@end

@implementation ABFBParser

@dynamic userID;
@dynamic name;
@dynamic surname;
@dynamic imageUrl;
@dynamic friends;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)parserWithResult:(id)result {
    return [[ABFBParser alloc] initWithResult:result];
}

#pragma mark - 
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.result = nil;
}

- (instancetype)initWithResult:(id)result {
    self = [super init];
    if (self) {
        self.result = result;
    }
    
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (NSString *)userID {
    return [self.result valueForKeyPath:ABUserID];
}

- (NSString *)name {
    return [self.result valueForKeyPath:ABUserName];
}

- (NSString *)surname {
    return [self.result valueForKeyPath:ABUserSurname];
}

- (NSURL *)imageUrl {
    return [NSURL URLWithString:[self.result valueForKeyPath:ABPictureURL]];
}

- (NSArray *)friends {
    NSArray *friends = [self.result valueForKeyPath:ABUserFriends];
    NSMutableArray *mutableFriends = [NSMutableArray arrayWithCapacity:[friends count]];
    for (id friend in friends) {
        ABUser *user = [ABUser new];
        
        user.name = [friend valueForKeyPath:ABUserName];
        user.surname = [friend valueForKeyPath:ABUserSurname];
        user.userID = [friend valueForKeyPath:ABUserID];
        user.imageUrl = [NSURL URLWithString:[friend valueForKeyPath:ABPictureURL]];
        
        [mutableFriends addObject:user];
    }
    
    return [mutableFriends copy];
}


@end
