//
//  UITableView+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/28/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "UITableView+ABExtension.h"

#import "UINib+ABExtension.h"

@implementation UITableView (ABExtension)

- (id)reusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([cls class])];
    if (!cell) {
        cell = [UINib nibWithClass:cls];
    }
    
    return cell;
}

@end
