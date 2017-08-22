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
#import "ABGCDExtension.h"

static NSString * const ABPlistName     = @"users.plist";
static const NSUInteger ABUsersCount    = 100;
static const NSUInteger ABDispatchDelay = 10;

@implementation ABUsersModel

- (void)saveModel {
    [NSKeyedArchiver archiveRootObject:[self copyObjects] toFile:[self savePath]];
}
- (void)performLoading {
    ABDispatchAfterDelay(ABDispatchDelay, ^{
        NSArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:[self savePath]];
        if (!users) {
            users = [ABUser objectsWithCount:ABUsersCount];
        }
        [self addObjects:users];
        
        self.state = ABModelDidLoad;
    });
}

- (void)dumpModel {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:[self savePath] error:nil];
    
    self.state = ABModelDidUnloaded;
}

#pragma mark -
#pragma mark Private

- (NSString *)savePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *savePath = [paths firstObject];
    
    return [savePath stringByAppendingPathComponent:ABPlistName];
}

@end
