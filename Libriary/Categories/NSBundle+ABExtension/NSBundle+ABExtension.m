//
//  NSBundle+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSBundle+ABExtension.h"

@implementation NSBundle (ABExtension)

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self loadNibNamed:NSStringFromClass([cls class]) owner:owner options:options];
    for (id object in objects) {
        if ([object isKindOfClass:cls]) {
            return object;
        }
    }
    return nil;
}

@end
