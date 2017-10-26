//
//  ABFBLoginContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABContext.h"

#import "ABFBCurrentUser.h"

@interface ABFBLoginContext : ABContext
@property (nonatomic, strong)   ABFBCurrentUser *user;

@end
