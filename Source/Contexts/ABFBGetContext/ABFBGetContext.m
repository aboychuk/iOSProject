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

@implementation ABFBGetContext

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    ABUser *user = self.user;
    NSUInteger modelState = self.user.state;
    
    @synchronized (user) {
        if (modelState == ABModelDidLoad || modelState == ABModelWillLoad) {
            user.state = modelState;
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
            [self parseResult:result];
            modelState = ABModelDidLoad;
        }
        if (error) {
            modelState = ABModelDidFailLoading;
        }
        if (handler) {
            handler(modelState);
        }
    }];
}

- (void)parseResult:(id)result {

}

@end
