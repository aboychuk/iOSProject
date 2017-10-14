//
//  ABGetContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBUserContext.h"

@interface ABFBGetContext : ABFBUserContext
@property (nonatomic, strong)   NSString        *graphPath;
@property (nonatomic, strong)   NSDictionary    *parameters;
//Method created for overriding, do not call it directly
- (void)parseResult:(id)result;

@end
