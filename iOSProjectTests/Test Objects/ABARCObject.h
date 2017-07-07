//
//  ABARCObject.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/5/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABARCObject : NSObject
@property (nonatomic, strong)               id  strongObject;
@property (nonatomic, weak)                 id  weakObject;
@property (nonatomic, unsafe_unretained)    id  assignObject;

- (void)putObjectInStrongProperty:(id)object;

@end
