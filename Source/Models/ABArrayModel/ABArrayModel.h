//
//  ABArrayModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

typedef NS_ENUM(NSUInteger, ABArrayModelState) {
    ABArrayModelObjectAdded,
    ABArrayModelObjectRemoved,
    ABArrayModelObjectMoved,
};

@interface ABArrayModel : ABObservableObject
@property (nonatomic, readonly)   NSUInteger  count;

- (void)addObject:(id)object;
- (void)addObjects:(id)objects;
- (void)addObject:(id)object atIndex:(NSUInteger)index;

- (void)removeObject:(id)object;
- (void)removeObjects:(id)objects;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)moveObjectFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
