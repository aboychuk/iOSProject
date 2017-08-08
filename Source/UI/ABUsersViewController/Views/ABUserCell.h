//
//  ABUserCell.h
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABTableViewCell.h"

@class ABUser;
@class ABImageView;

@interface ABUserCell : ABTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;
@property (nonatomic, strong)   IBOutlet ABImageView    *userImageView;

@property (nonatomic, strong)   ABUser  *user;

- (void)fillWithModel:(ABUser *)user;

@end
