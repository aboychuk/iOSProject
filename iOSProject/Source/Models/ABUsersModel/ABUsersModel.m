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

static NSString * const ABPlistName     = @"users.plist";
static const NSUInteger ABUsersCount    = 10;

@interface ABUsersModel ()
@property (nonatomic, strong)   NSArray *notifications;

- (NSString *)savePath;
- (void)subscribeNotifications;
- (void)unsubscribeNotifications;

@end

@implementation ABUsersModel

@dynamic notifications;

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
#pragma mark Accessors

- (NSArray *)notifications {
    return @[UIApplicationDidEnterBackgroundNotification,
             UIApplicationWillTerminateNotification];
}

#pragma mark - 
#pragma mark Public

- (void)saveModel {
    [NSKeyedArchiver archiveRootObject:self.allObjects toFile:[self savePath]];
}
- (void)performLoading {
    NSArray *users = [NSKeyedUnarchiver unarchiveObjectWithFile:[self savePath]];
    if (!users.count) {
        users = [ABUser objectsWithCount:ABUsersCount];
    }
    [self performBlockWithoutNotification:^{
        [self addObjects:users];
    }];
    
    self.state = ABModelDidLoad;
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
    for (id notification in self.notifications) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveModel)
                                                     name:notification
                                                   object:nil];
    }
}

- (void)unsubscribeNotifications {
    for (id notification in self.notifications) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:notification
                                                      object:nil];
    }
}

@end
