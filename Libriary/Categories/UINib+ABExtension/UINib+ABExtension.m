//
//  UINib+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/28/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "UINib+ABExtension.h"

@implementation UINib (ABExtension)

+ (instancetype)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (instancetype)nibWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self nibWithNibName:NSStringFromClass([cls class]) bundle:bundle];
}

@end
