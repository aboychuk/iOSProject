//
//  ABUserDetailContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserDetailContext.h"

#import "ABUser.h"

@implementation ABUserDetailContext

#pragma mark -
#pragma mark Accessors

- (ABUser *)user {
    return self.model;
}

#pragma mark - 
#pragma mark Public Methods

- (void)execute {
    NSDictionary *parameters = @{@"fields" : @"first_name,last_name,hometown,picture.type(large)"};
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.model
                                                                   parameters:parameters];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            [self parseResult:result];
        }
    }];
}

- (void)parseResult:(id)result {
    NSURL *url = [NSURL URLWithString:[[[result valueForKey:@"picture"] valueForKey:@"data"] valueForKey:@"url"]];
    
    self.user.userID = [result valueForKey:@"userID"];
    self.user.name = [result valueForKey:@"first_name"];
    self.user.surname = [result valueForKey:@"last_name"];
    self.user.hometown  = [result valueForKey:@"hometown"];
    self.user.imageUrl = url;
    self.user.state = ABModelDidLoad;
}

@end
