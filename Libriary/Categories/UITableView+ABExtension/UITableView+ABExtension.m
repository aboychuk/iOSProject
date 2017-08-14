//
//  UITableView+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/28/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "UITableView+ABExtension.h"

#import "UINib+ABExtension.h"

#import "ABArrayModelChange.h"

@implementation UITableView (ABExtension)

- (id)reusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass([cls class])];
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

- (void)updateWithBlock:(void (^)(void))block {
    if (!block) {
        return;
    }
    
    [self beginUpdates];
    block();
    [self endUpdates];
}

- (void)applyModel:(ABArrayModelChange *)model {
    [self applyModel:model
           inSection:0
        rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyModel:(ABArrayModelChange *)model
                    inSection:(NSUInteger)section
{
    [self applyModel:model
           inSection:section
        rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyModel:(ABArrayModelChange *)model
                    inSection:(NSUInteger)section
                 rowAnimation:(UITableViewRowAnimation)rowAnimation
{
    [model updateTableView:self
                 inSection:section
          withRowAnimation:rowAnimation];
}


@end
