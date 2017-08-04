//
//  NSMutableArray+ABExtension.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/4/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ABExtension)

- (void)moveObjectAtIndex:(NSUInteger)sourceIndex
                  toIndex:(NSUInteger)destinationIndex;

@end
