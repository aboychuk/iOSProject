//
//  ABFBLogoutContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBLogoutContext.h"

@implementation ABFBLogoutContext

- (void)executeWithCompletionHandler:(ABContextCompletionHandler)handler {
    [[FBSDKLoginManager new] logOut];
    if (handler) {
        handler(ABModelDidUnloaded);
    }
}

@end
