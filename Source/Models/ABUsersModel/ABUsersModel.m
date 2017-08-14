//
//  ABUsersModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUsersModel.h"

#import "ABUser.h"


static NSString * const ABPlistName     = @"arrayModelData.plist";
static const NSUInteger usersCount      = 3000;

@implementation ABUsersModel

- (void)save {
    [NSKeyedArchiver archiveRootObject:[self copy] toFile:[self savePath]];
}
- (void)processLoadingInBackground {

}

#pragma mark -
#pragma mark Private

- (NSString *)savePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *savePath = [paths firstObject];
    
    return [savePath stringByAppendingPathComponent:ABPlistName];
}

@end
