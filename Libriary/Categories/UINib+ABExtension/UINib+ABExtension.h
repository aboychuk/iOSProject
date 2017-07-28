//
//  UINib+ABExtension.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/28/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (ABExtension)

+ (instancetype)nibWithClass:(Class)cls;
+ (instancetype)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

@end
