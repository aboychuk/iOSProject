//
//  ABARCSpec.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/5/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "Kiwi.h"
#import "ABARCObject.h"

SPEC_BEGIN(ABARCSpec)

describe(@"ARC", ^{
    ABARCObject *object = [ABARCObject new];
    
    context(@"when putting object into strong property", ^{
        beforeEach(^{
            __strong NSObject *strongObject = [NSObject new];
            object.strongObject = strongObject;

        });
        it(@"should be contained in that property", ^{
            [[object.strongObject shouldNot] beNil];
        });
    });
});

SPEC_END
