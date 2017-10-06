//
//  ABUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ABUser.h"

#import "ABImageModel.h"

#import "ABRandomNumber.h"
#import "NSString+ABExtensions.h"

static NSString * const ABName = @"name";
static NSString * const ABSurname = @"surname";

@implementation ABUser

@dynamic fullname;
@dynamic imageModel;
@dynamic authorized;

#pragma mark
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
        self.surname = [NSString randomName];
    }
    
    return self;
}

#pragma mark
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (ABImageModel *)imageModel {
    return [ABImageModel imageWithUrl:self.imageUrl];
}

- (BOOL)isAuthorized {
    return [self.userID isEqualToString:[FBSDKAccessToken currentAccessToken].userID];
}

#pragma mark -
#pragma marl NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:ABName];
        self.surname = [coder decodeObjectForKey:ABSurname];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:ABName];
    [coder encodeObject:self.surname forKey:ABSurname];
}

@end
