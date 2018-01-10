//
//  NSObject+ABObjectExtension.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/16/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSObject+ABObjectExtension.h"
#import "NSArray+ABExtension.h"

@implementation NSObject (ABObjectExtension)

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray objectsWithCount:count factoryBlock: ^{ return [self new]; }];
}

@end
