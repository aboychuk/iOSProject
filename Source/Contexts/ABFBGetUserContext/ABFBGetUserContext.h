//
//  ABFBGetUserContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBGetContext.h"

@interface ABFBGetUserContext : ABFBGetContext
@property (nonatomic, strong)   NSString        *graphPath;
@property (nonatomic, strong)   NSDictionary    *parameters;

- (void)parseResult:(id)result;

@end
