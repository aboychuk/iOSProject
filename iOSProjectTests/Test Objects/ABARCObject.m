//
//  ABARCObject.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/5/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABARCObject.h"

@implementation ABARCObject

#pragma mark
#pragma mark - Initializitions and Deallocations

- (void)dealloc {

}

#pragma mark
#pragma mark Public Methods

- (void)putObjectInStrongProperty:(id)object {
    __strong NSObject *strongObject = [NSObject new];
    self.strongObject = strongObject;
}

@end
