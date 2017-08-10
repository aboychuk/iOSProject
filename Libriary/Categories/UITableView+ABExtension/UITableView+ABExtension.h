//
//  UITableView+ABExtension.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/28/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ABExtension)

- (id)reusableCellWithClass:(Class)cls;
- (void)updateWithBlock:(void (^)(void))block;

@end
