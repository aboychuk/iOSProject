 //
//  ABSquareView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSquareView.h"

#import "ABRandomNumber.h"
#import "ABMacro.h"

static NSTimeInterval ABAnimationDuration   = 1;

@interface ABSquareView ()
@property (nonatomic, assign, getter=isRunning) BOOL    running;

- (ABSquarePosition)nextPosition;
- (ABSquarePosition)randomPosition;
- (CGRect)squereFrameForPosition:(ABSquarePosition)squarePosition;

@end

@implementation ABSquareView

#pragma mark
#pragma mark - Accessors

- (void)setSquarePosition:(ABSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition
                   animated:YES];
}

- (void)setSquarePosition:(ABSquarePosition)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition
                   animated:animated
          completionHandler:nil];
}

- (void)setSquarePosition:(ABSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(ABCompletionBlock)completionHandler
{
    [UIView animateWithDuration:animated ? ABAnimationDuration : 0
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseOut
                     animations:^{
                         self.squere.frame = [self squereFrameForPosition:squarePosition];
                         NSLog(@"squereOrigin%@", NSStringFromCGPoint(self.squere.frame.origin));
    }
                     completion:^(BOOL finished) {
                         if (completionHandler) {
                             completionHandler(finished);
                         }
                         _squarePosition = squarePosition;
                     }];
}

#pragma mark
#pragma mark - Public Methods

- (void)startRandomMoving {
    self.running = !self.running;
    [self setSquarePosition:[self randomPosition]
                   animated:YES];
}

- (void)startCycleMove {
    self.running = !self.running;
    [self startClockwiseMoving];
}

- (void)startClockwiseMoving {
    ABWeakify(self);
    [self setSquarePosition:[self nextPosition]
                   animated:YES
          completionHandler:^(BOOL finished) {
                           ABStrongify(self);
                           if ([self isRunning]) {
                               [self startClockwiseMoving];
                           } else {
                               self.running = NO;
                           }
                   }];
}

#pragma mark
#pragma mark - Private Methods

- (CGRect)squereFrameForPosition:(ABSquarePosition)position {
    CGRect squereFrame = self.squere.frame;
    CGPoint squerePoint = CGPointZero;
    
    CGFloat maxXPosition = self.frame.size.width - squereFrame.size.width;
    CGFloat maxYPosition = self.frame.size.height - squereFrame.size.height;
    
    switch (position) {
        case ABSquarePositionTopRight:
            squerePoint.x = maxXPosition;
            break;
            
        case ABSquarePositionBottomRight:
            squerePoint.x = maxXPosition;
            squerePoint.y = maxYPosition;
            break;
            
        case ABSquarePositionBottomLeft:
            squerePoint.y = maxYPosition;
            break;
            
        default:
            break;
    }
    squereFrame.origin = squerePoint;

    return squereFrame;
}

- (ABSquarePosition)nextPosition {
    return (self.squarePosition + 1) % ABSquarePositionCount;
}

- (ABSquarePosition)randomPosition {
    ABSquarePosition randomPosition = ABRandomWithMaxValue(ABSquarePositionCount);
    if (randomPosition == self.squarePosition) {
        [self randomPosition];
    }
    
    return randomPosition;
}

@end

