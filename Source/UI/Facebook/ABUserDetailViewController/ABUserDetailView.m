//
//  ABUserDetailView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserDetailView.h"

#import "ABUser.h"
#import "ABImageView.h"

@implementation ABUserDetailView

- (void)fillWithModel:(ABUser *)model {
    self.userImage.imageModel = model.imageModel;
    self.userFullName.text = model.fullname;
}

@end
