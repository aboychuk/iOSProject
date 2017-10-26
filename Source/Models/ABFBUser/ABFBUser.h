//
//  ABFBUser.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/26/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUser.h"

@class ABImageModel;
@class ABUsersModel;

@interface ABFBUser : ABUser
@property (nonatomic, readonly) ABImageModel    *imageModel;
@property (nonatomic, copy)     NSString        *userID;
@property (nonatomic, strong)   NSURL           *imageUrl;
@property (nonatomic, strong)   ABUsersModel    *friends;

@end
