//
//  ABUserCell.h
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABTableViewCell.h"

@class ABUser;

@interface ABUserCell : ABTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *userImageView;

@property (nonatomic, strong)   ABUser  *user;

- (void)fillWithModel:(ABUser *)user;

@end
