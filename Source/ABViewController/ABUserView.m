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

- (void)rotateLabel {
    self.label.transform = CGAffineTransformMakeRotation((float)arc4random() / UINT32_MAX * 2 * M_PI);
}

- (void)fillWithUser:(ABUser *)user {
    self.label.text = user.fullname;
}

@end
