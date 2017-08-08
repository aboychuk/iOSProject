//
//  ABUserCell.m
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserCell.h"

#import "ABUser.h"

#import "ABImageView.h"

@implementation ABUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - 
#pragma mark Accessors

- (void)setUser:(ABUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(ABUser *)user {
    self.fullNameLabel.text = user.fullname;
    
    static dispatch_once_t onceToken;
    static dispatch_queue_t queue = nil;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("mama", DISPATCH_QUEUE_SERIAL);
    });
    
    dispatch_async(queue, ^{
        UIImage *image = user.image;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.userImageView.contentImageView.image = image;

        });
    });
}

@end
