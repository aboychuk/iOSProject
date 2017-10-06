//
//  NSString+ABExtensions.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 5/12/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ABExtensions)

//random name
+ (instancetype)randomName;
+ (instancetype)randomNameWithLength:(NSUInteger)length;

//english
+ (instancetype)numericAlphabet;
+ (instancetype)alphanumericAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)capitalizedLetterAlphabet;
+ (instancetype)letterAlphabet;
+ (instancetype)alphabetWithUnicodeRange:(NSRange)range;

//returns string with english alphanumeric characters of random length
//of up to 30 with the class of reciever
+ (instancetype)randomString;

//returns string with english alphanumeric characters of length
//with the class of reciever
+ (instancetype)randomStringWithLength:(NSUInteger)length;

//returns string with characters from alphabet of length
//with the class of reciever
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

//returns valid string for Unix filesystem by replacing invalid characters with "" character.
+ (instancetype)stringByReplacingIllegalCharactersFromString:(NSString *)string;

//returns valid string for Unix filesystem by replacing all non alphanumeric characters with "%" character.
+ (instancetype)stringWithAlphaNumericCharactersFromString:(NSString *)string;

- (NSArray *)symbols;


@end
