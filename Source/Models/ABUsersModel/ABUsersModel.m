//
//  ABUsersModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUsersModel.h"

#import "ABUser.h"

#import "NSObject+ABObjectExtension.h"


static NSString * const ABPlistName     = @"arrayModelData.plist";
static const NSUInteger usersCount      = 10;

@implementation ABUsersModel

- (void)save {
    [NSKeyedArchiver archiveRootObject:[self copyObjects] toFile:[self savePath]];
}
- (void)performLoading {
    NSArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:[self savePath]];
    if (!users) {
        users = [ABUser objectsWithCount:usersCount];
    }
    [self addObjects:users];
}

#pragma mark -
#pragma mark Private

- (NSString *)savePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *savePath = [paths firstObject];
    
    return [savePath stringByAppendingPathComponent:ABPlistName];
}

@end
