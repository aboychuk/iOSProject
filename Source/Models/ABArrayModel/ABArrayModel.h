//
//  ABArrayModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

#import "ABArrayModelChange.h"

@class ABArrayModel;
@class ABArrayModelChange;

typedef NS_ENUM(NSUInteger, ABArrayModelState) {
    ABArrayModelObjectChanged,
    ABArrayModelObjectCount
};

@protocol ABArrayModelObserver <NSObject>

@optional
- (void)arrayModel:(ABArrayModel *)arrayModel didChangeWithArrayModelChange:(ABArrayModelChange *)changeModel;

@end

@interface ABArrayModel : ABObservableObject
@property (nonatomic, readonly) NSUInteger  count;

- (instancetype)initWithObjects:(NSArray *)objects;

- (void)addObject:(id)object;
- (void)addObjects:(id)objects;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;

- (void)removeObject:(id)object;
- (void)removeObjects:(id)objects;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)moveObjectFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)object;

@end
