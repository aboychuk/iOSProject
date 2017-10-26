//
//  ABUserDetailView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABView.h"

@class ABImageView;
@class ABFBUser;

@interface ABUserDetailView : ABView
@property (nonatomic, strong)   IBOutlet    UIButton    *friendsButton;
@property (nonatomic, strong)   IBOutlet    ABImageView *userImage;
@property (nonatomic, strong)   IBOutlet    UILabel     *userFullName;

- (void)fillWithModel:(ABFBUser *)model;

@end
