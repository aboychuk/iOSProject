//
//  ABRandomNumber.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL ABRandomBool(void);
NSRange ABMakeRange(NSUInteger firstNumber, NSUInteger lastNumber);
NSUInteger ABRandomValueInRange(NSRange range);
NSUInteger ABRandomWithMaxValue(NSUInteger value);
