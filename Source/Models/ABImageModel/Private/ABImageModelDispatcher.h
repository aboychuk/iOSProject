//
//  ABImageModelDispatcher.h
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABImageModelDispatcher : NSObject
@property (nonatomic, readonly) NSOperationQueue  *queue;

+ (instancetype)sharedDispatcher;

@end
