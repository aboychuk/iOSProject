//
//  ABUserCell.m
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserCell.h"

#import "ABFBUser.h"
#import "ABImageView.h"
#import "ABImageModel.h"

@interface ABUserCell ()

- (void)fillWithModel:(ABUser *)user;

@end

@implementation ABUserCell

#pragma mark - 
#pragma mark Accessors

- (void)setUser:(ABFBUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(ABFBUser *)user {
    self.fullNameLabel.text = user.fullname;
    self.userImageView.imageModel = user.imageModel;
}

#pragma mark -
#pragma mark Overriden Methods

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.user = nil;
    self.userImageView.contentImageView.image = nil;
}

@end
