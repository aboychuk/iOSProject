//
//  ABFBGetContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBGetContext.h"

#import "ABUsersModel.h"
#import "ABFBParser.h"

#import "ABMacro.h"
#import "NSFileManager+ABExtension.h"

@interface ABFBGetContext ()
@property (nonatomic, readonly) NSString    *pathToCachedResult;

- (BOOL)saveResult:(id)result;
- (id)loadResult;

@end

@implementation ABFBGetContext

@dynamic pathToCachedResult;

#pragma mark -
#pragma mark Accessors

- (NSString *)pathToCachedResult {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directoryPath = [[paths firstObject] stringByAppendingPathComponent:self.plistName];
    
    return directoryPath;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    ABUser *user = self.user;
    NSUInteger modelState = self.user.state;
    
    @synchronized (user) {
        if (modelState == ABModelDidLoad || modelState == ABModelWillLoad) {
            [user notifyOfState:modelState];
            return;
        }
        user.state = ABModelWillLoad;
    }
    [super execute];
}

- (void)executeWithCompletionHandler:(ABContextCompletionHandler)handler {
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                                                   parameters:self.parameters];
    ABWeakify(self);
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        ABStrongifyAndReturnIfNil(self);
        NSUInteger modelState = self.user.state;
        if (result) {
            if ([self saveResult:result]) {
                [self parseResult:result];
                modelState = ABModelDidLoad;
            }
        }
        if (error) {
            if (![self loadResult]) {
                modelState = ABModelDidFailLoading;

            }
            modelState = ABModelDidLoad;
        }
        if (handler) {
            handler(modelState);
        }
    }];
}

- (void)parseResult:(id)result {

}

- (BOOL)saveResult:(id)result {
    return [NSKeyedArchiver archiveRootObject:result toFile:self.pathToCachedResult];
}

- (id)loadResult {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:self.pathToCachedResult];
}

@end
