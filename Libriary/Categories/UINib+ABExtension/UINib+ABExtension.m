//
//  UINib+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/28/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "UINib+ABExtension.h"

#import "NSArray+ABExtension.h"

@implementation UINib (ABExtension)

+ (instancetype)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (instancetype)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass([cls class]) bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner bundle:nil options:nil];
}

+ (id)objectWithClass:(Class)cls owner:(id)owner bundle:(NSBundle *)bundle options:(NSDictionary *)options {
    UINib *nib = [self nibWithClass:cls bundle:bundle];
    return [nib objectWithClass:cls owner:owner options:options];
}

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner {
    return [self objectWithClass:cls owner:owner options:nil];
}

- (id)objectWithClass:(Class)cls owner:(id)owner options:(NSDictionary *)options {
    NSArray *objects = [self instantiateWithOwner:owner options:options];
    if (objects) {
        return [objects objectWithClass:cls];
    }
    
    return nil;
}

@end
