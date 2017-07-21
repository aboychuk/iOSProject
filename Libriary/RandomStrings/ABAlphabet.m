//
//  ABAlphabet.m
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/24/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAlphabet.h"

#import <math.h>

#import "ABClasterAlphabet.h"
#import "ABRangeAlphabet.h"
#import "ABStringsAlphabet.h"

#import "NSString+ABExtensions.h"

NSRange ABAlphabetRange(unichar value1, unichar value2) {
    unichar minValue = MIN(value1, value2);
    unichar maxValue = MAX(value1, value2);
    
    return NSMakeRange(minValue, maxValue - minValue + 1);
}

@implementation ABAlphabet

#pragma mark
#pragma mark Class Methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[ABRangeAlphabet alloc] initWithRange:range];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[ABStringsAlphabet alloc] initWithStrings:strings];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[ABClasterAlphabet alloc] initWithAlphabets:alphabets];
}

+ (instancetype)alphabetWithSymbols:(NSString *)string {
    return [self alphabetWithStrings:[string symbols]];
}

#pragma mark
#pragma mark Initializations and Deallocations

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    return [[ABClasterAlphabet alloc] initWithAlphabets:alphabets];
}

- (instancetype)initWithRange:(NSRange)range {
    return [[ABRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    return [[ABStringsAlphabet alloc] initWithStrings:strings];
}

- (instancetype)initWithSymbols:(NSString *)string {
    return [self initWithStrings:[string symbols]];
}

#pragma mark
#pragma mark Public Methods

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    
    return string;
}

#pragma mark
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])stackbuf
                                    count:(NSUInteger)resultLength
{
    state->mutationsPtr = &state->extra[0];;
    
    NSUInteger length = MAX(state->state + resultLength, [self count]);
    resultLength = length - state->state;
    
    if (0 != resultLength) {
        for (NSUInteger index = 0; index < length; index++) {
            stackbuf[index] = self[index + state->state];
        }
    }
    
    state->itemsPtr = stackbuf;
    
    state->state += resultLength;
    
    return resultLength;
}

@end
