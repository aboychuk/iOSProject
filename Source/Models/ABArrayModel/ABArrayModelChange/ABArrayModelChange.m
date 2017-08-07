//
//  ABArrayModelChange.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModelChange.h"

#import "ABArrayModelChangeAdd.h"
#import "ABArrayModelChangeRemove.h"
#import "ABArrayModelChangeMove.h"

@implementation ABArrayModelChange

+ (instancetype)modelChangeAddWithIndex:(NSUInteger)index {
    return [[ABArrayModelChangeAdd alloc] initWithIndex:index];
}

+ (instancetype)modelChangeDeleteWithIndex:(NSUInteger)index {
    return [[ABArrayModelChangeRemove alloc] initWithIndex:index];
}

+ (instancetype)modelChangeMoveAtIndex:(NSUInteger)sourceIndex
                               toIndex:(NSUInteger)destinationIndex
{
    return [[ABArrayModelChangeMove alloc] initWithSourceIndex:sourceIndex
                                              destinationIndex:destinationIndex];
}

@end

@implementation ABArrayModelChange (UITableView)

- (void)updateTableView:(UITableView *)tableView
{
    [self updateTableView:tableView
                inSection:0
         withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateTableView:(UITableView *)tableView
              inSection:(NSUInteger)section
{
    [self updateTableView:tableView
                inSection:section
         withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateTableView:(UITableView *)tableView
              inSection:(NSUInteger)section
       withRowAnimation:(UITableViewRowAnimation)animation
{
    
}


@end
