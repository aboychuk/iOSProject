//
//  ABUserView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserView.h"
#import "ABUser.h"

@implementation ABUserView

#pragma mark
#pragma mark Accessors

- (void)setUser:(ABUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithUser:user];
    }
}

#pragma mark
#pragma mark Public Methods

- (void)fillWithUser:(ABUser *)user {
    self.label.text = user.fullname;
}

@end
