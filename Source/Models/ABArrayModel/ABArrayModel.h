//
//  ABArrayModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

@interface ABArrayModel : ABObservableObject

- (void)addObject:(id)object;
- (void)addObjects:(id)objects;
- (void)addObject:(id)object atIndex:(NSUInteger)index;

- (void)removeObject:(id)object;
- (void)removeObjects:(id)objects;
- (void)removeObject:(id)object atIndex:(NSUInteger)index;

- (id)objectAtIndex:(NSUInteger)index;

@end
