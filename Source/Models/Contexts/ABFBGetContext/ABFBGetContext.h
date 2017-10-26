//
//  ABGetContext.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/6/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBContext.h"

@interface ABFBGetContext : ABFBContext
@property (nonatomic, strong)   NSString        *graphPath;
@property (nonatomic, strong)   NSDictionary    *parameters;
@property (nonatomic, readonly) NSString        *plistName;
//Method created for overriding, do not call it directly
- (void)parseResult:(id)result;

@end
