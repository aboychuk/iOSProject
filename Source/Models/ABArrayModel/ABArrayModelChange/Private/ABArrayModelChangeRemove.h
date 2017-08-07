//
//  ABArrayModelChangeRemove.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModelChange.h"

@interface ABArrayModelChangeRemove : ABArrayModelChange

- (instancetype)initWithIndex:(NSUInteger)index;

- (void)updateTableView:(UITableView *)tableView
              inSection:(NSIndexSet *)sections
       withRowAnimation:(UITableViewRowAnimation)animation;

@end
