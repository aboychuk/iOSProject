//
//  ABSharedCache.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABSharedCache : NSObject

+ (instancetype)sharedCache;

- (void)addObject:(id)object forKey:(id)key;
- (void)removeObjectforKey:(id)key;
- (id)objectForKey:(id)key;

@end
