//
//  NSBundle+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSBundle+ABExtension.h"

#import "NSArray+ABExtension.h"

@implementation NSBundle (ABExtension)

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self loadNibNamed:NSStringFromClass([cls class]) owner:owner options:options];
    if (objects) {
        return [objects objectWithClass:cls];
    }

    return nil;
}

@end
