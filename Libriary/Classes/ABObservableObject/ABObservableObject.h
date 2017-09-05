//
//  ABObservableObject.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABConstants.h"

@interface ABObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;
@property (nonatomic, readonly) BOOL        notification; //Disables notification, default state is YES;


- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObject:(id)observer;

- (void)setState:(NSUInteger)state;

- (void)notifyOfState:(NSUInteger)state;
- (void)notifyOfState:(NSUInteger)state withObject:(id)object;

- (void)performBlockWithNotification:(ABVoidBlock)voidBlock;
- (void)performBlockWithoutNotification:(ABVoidBlock)voidBlock;

//This method is intendent for subclassing. Never call it directly.
- (SEL)selectorForState:(NSUInteger)state;

@end
