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

#import "ABConstants.h"

@implementation ABUsersModel

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubscribeNotifications];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self subscribeNotifications];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Public

- (void)saveModel {
    [NSKeyedArchiver archiveRootObject:self.allObjects toFile:[self savePath]];
}
- (void)performLoading {
    ABDispatchAfterDelay(ABDispatchDelay, ^{
        NSArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:[self savePath]];
        if (!users.count) {
            users = [ABUser objectsWithCount:ABUsersCount];
        }
        [self performBlockWithoutNotification:^{
            [self addObjects:users];
        }];
        
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

#pragma mark -
#pragma mark NSNotificationCenter

- (void)subscribeNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(saveModel)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dumpModel)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
}

- (void)unsubscribeNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationWillTerminateNotification
                                                  object:nil];
}

@end
