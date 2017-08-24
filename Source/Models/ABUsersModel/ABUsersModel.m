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
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self prepareNSNotificationCenter];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Public

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

#pragma mark -
#pragma mark NSNotificationCenter

- (void)prepareNSNotificationCenter {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(saveModel)
                                                 name:ABSaveNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadModel)
                                                 name:ABLoadNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dumpModel)
                                                 name:ABDumpNotification
                                               object:nil];
}

@end
