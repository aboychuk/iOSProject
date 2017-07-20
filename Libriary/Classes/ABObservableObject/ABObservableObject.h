//
//  ABObservableObject.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(id)observer;
- (BOOL)isObservedByObject:(id)observer;

- (void)setState:(NSUInteger)state;

- (void)notifyOfState:(NSUInteger)state;

//This method is intendent for subclassing. Never call it directly.
- (SEL)selectorForState:(NSUInteger)state;

@end
