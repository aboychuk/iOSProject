//
//  NSMutableArray+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSMutableArray+ABExtension.h"

@implementation NSMutableArray (ABExtension)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex
                  toIndex:(NSUInteger)destinationIndex
{
    if (sourceIndex == destinationIndex) {
        return;
    }
    id object = [self objectAtIndex:sourceIndex];
    [self removeObjectAtIndex:sourceIndex];
    [self insertObject:object atIndex:destinationIndex];
}

@end
