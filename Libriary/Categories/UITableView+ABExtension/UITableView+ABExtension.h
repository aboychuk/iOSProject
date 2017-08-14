//
//  UITableView+ABExtension.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/28/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABArrayModelChange;

@interface UITableView (ABExtension)

- (id)reusableCellWithClass:(Class)cls;
- (void)updateWithBlock:(void (^)(void))block;

- (void)applyModel:(ABArrayModelChange *)model;

- (void)applyModel:(ABArrayModelChange *)model
                    inSection:(NSUInteger)section;

- (void)applyModel:(ABArrayModelChange *)model
                    inSection:(NSUInteger)section
                 rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
