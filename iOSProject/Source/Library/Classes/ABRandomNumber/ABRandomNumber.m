//
//  ABRandomNumber.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABRandomNumber.h"

BOOL ABRandomBool(void) {
    return arc4random_uniform(2);
}

NSRange ABMakeRange(NSUInteger firstNumber, NSUInteger lastNumber) {
    NSUInteger minValue = MIN(firstNumber, lastNumber);
    NSUInteger maxValue = MAX(firstNumber, lastNumber);
    
    return NSMakeRange(minValue, maxValue - minValue + 1);
}

NSUInteger ABRandomValueInRange(NSRange range) {
    return arc4random_uniform((uint32_t)range.length) + range.location;
}


NSUInteger ABRandomWithMaxValue(NSUInteger value) {
    return ABRandomValueInRange(ABMakeRange(0, value));
}
