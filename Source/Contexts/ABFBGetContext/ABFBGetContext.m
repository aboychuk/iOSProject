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
    [self.user loadModel];
    ABWeakify(self);
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                                                   parameters:self.parameters];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            ABStrongifyAndReturnIfNil(self);
            [self parseResult:result];
            self.user.state = ABModelDidLoad;
        }
    }];
}

- (void)parseResult:(id)result {

}


@end
