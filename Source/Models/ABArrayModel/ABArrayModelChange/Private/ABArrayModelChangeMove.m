//
//  ABArrayModelChangeMove.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModelChangeMove.h"

@interface ABArrayModelChangeMove ()
@property (nonatomic, assign)   NSUInteger  sourceIndex;
@property (nonatomic, assign)   NSUInteger  destinationIndex;

@end

@implementation ABArrayModelChangeMove

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithSourceIndex:(NSUInteger)sourceIndex
                   destinationIndex:(NSUInteger)destinationIndex
{
    self = [super init];
    if (self) {
        self.sourceIndex = sourceIndex;
        self.destinationIndex = destinationIndex;
    }
    
    return self;
}

#pragma mark -
#pragma mark ABArrayModelChange (UITableView)

- (void)updateTableView:(UITableView *)tableView
              inSection:(NSUInteger)section
       withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath *sourceIndex = [NSIndexPath indexPathForRow:self.index inSection:section];
    NSIndexPath *destinationIndex = [NSIndexPath indexPathForRow:self.destinationIndex inSection:section];
    
    [tableView beginUpdates];
    [tableView moveRowAtIndexPath:sourceIndex toIndexPath:destinationIndex];
    [tableView endUpdates];
}


@end
