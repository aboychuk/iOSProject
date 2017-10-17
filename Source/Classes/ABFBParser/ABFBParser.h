//
//  ABFBParser.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/13/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ABUser;
@class ABUsersModel;

@interface ABFBParser : NSObject
@property (nonatomic, readonly)     NSString        *name;
@property (nonatomic, readonly)     NSString        *surname;
@property (nonatomic, readonly)     NSString        *userID;
@property (nonatomic, readonly)     NSURL           *imageUrl;
@property (nonatomic, readonly)     NSArray         *friends;

+ (instancetype)parserWithResult:(id)result;

- (instancetype)initWithResult:(id)result;

@end
