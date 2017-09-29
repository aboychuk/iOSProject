//
//  ABUser.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ABModel.h"

@class ABImageModel;

@interface ABUser : ABModel
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, copy)     NSString        *surname;
@property (nonatomic, readonly) NSString        *fullname;
@property (nonatomic, readonly) ABImageModel    *imageModel;
@property (nonatomic, readonly) NSString        *userID;

@end
