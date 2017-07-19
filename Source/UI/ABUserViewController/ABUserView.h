//
//  ABUserView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABUser;

@interface ABUserView : UIView
@property (nonatomic, strong)   IBOutlet UILabel            *label;
@property (nonatomic, strong)   ABUser                      *user;

- (void)fillWithUser:(ABUser *)user;

@end
