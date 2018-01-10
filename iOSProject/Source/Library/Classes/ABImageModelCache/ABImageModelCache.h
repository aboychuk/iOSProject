//
//  ABImageModelCache.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ABImageModelCache : NSObject

+ (instancetype)sharedCache;

- (void)addModel:(id)model forKey:(id)key;
- (void)removeModelForKey:(id)key;
- (id)modelForKey:(id)key;

@end
