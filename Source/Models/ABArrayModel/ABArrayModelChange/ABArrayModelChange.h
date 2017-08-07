//
//  ABArrayModelChange.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABArrayModel.h"

#import "ABArrayModelChangeAdd.h"
#import "ABArrayModelChangeRemove.h"
#import "ABArrayModelChangeMove.h"

@interface ABArrayModelChange : NSObject

+ (instancetype)modelChangeAddWithIndex:(NSUInteger)index;
+ (instancetype)modelChangeDeleteWithIndex:(NSUInteger)index;
+ (instancetype)modelChangeMoveAtIndex:(NSUInteger)sourceIndex
                               toIndex:(NSUInteger)destinationIndex;

- (void)updateTableView:(UITableView *)tableView;

- (void)updateTableView:(UITableView *)tableView
           withSections:(NSIndexSet *)sections
           rowAnimation:(UITableViewRowAnimation)animation;

@end
