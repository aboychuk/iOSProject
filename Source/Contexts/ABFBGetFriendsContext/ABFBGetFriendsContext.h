//
//  ABFBGetFriendsContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBGetContext.h"

@interface ABFBGetFriendsContext : ABFBGetContext
@property (nonatomic, strong)   NSString        *graphPath;
@property (nonatomic, strong)   NSDictionary    *parameters;

@end
