//
//  ABSquereView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSquereView.h"

static BOOL ABSquereAnimation               = YES;
static NSTimeInterval ABAnimationDuration   = 1;

@implementation ABSquereView

#pragma mark
#pragma mark - Accessors

- (void)setSquerePosition:(ABSquerePosition)squerePosition {
    [self setSquerePosition:squerePosition animated:ABSquereAnimation];
}

- (void)setSquerePosition:(ABSquerePosition)squerePosition
                 animated:(BOOL)animated
{
    [self setSquerePosition:squerePosition animated:animated completionHandler:nil];
}

- (void)setSquerePosition:(ABSquerePosition)squerePosition
                 animated:(BOOL)animated
        completionHandler:(ABVoidBlock)handler
{
    
}

#pragma mark
#pragma mark - Private Methods

- (CGPoint)squereOriginPosition:(ABSquerePosition)position {
    CGPoint squerePoint = self.squere.frame.origin;
    CGPoint squerePointTopRight = CGPointMake(self.frame.size.width - self.squere.frame.size.width, 0);
    CGPoint squerePointBottomRight = CGPointMake(self.frame.size.width - self.squere.frame.size.width,
                                                 self.frame.size.height - self.squere.frame.size.height);
    CGPoint squerePointBottomLeft = CGPointMake(0, self.frame.size.height - self.squere.frame.size.height);

    switch (position) {
        case ABSquerePositionTopLeft:
            return squerePoint;
            break;
            
        case ABSquerePositionTopRight:
            return squerePoint = squerePointTopRight;
            break;
            
        case ABSquerePositionBottomRight:
            return squerePoint = squerePointBottomRight;
            break;
        
        case ABSquerePositionBottomLeft:
            return squerePoint = squerePointBottomLeft;
            break;
            
        default:
            break;
    }
    
    return squerePoint;
}


@end

