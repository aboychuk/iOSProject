 //
//  ABSquereView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSquereView.h"

#import "ABRandomNumber.h"
#import "ABMacro.h"

static NSTimeInterval ABAnimationDuration   = 1;

@interface ABSquereView ()
@property (nonatomic, assign, getter=isRunning) BOOL    running;

- (ABSquerePosition)nextPosition;
- (ABSquerePosition)randomPosition;
- (CGRect)squereFrameForPosition:(ABSquerePosition)squerePosition;

@end

@implementation ABSquereView

#pragma mark
#pragma mark - Accessors

- (void)setSquerePosition:(ABSquerePosition)squerePosition {
    [self setSquerePosition:squerePosition
                   animated:YES];
}

- (void)setSquerePosition:(ABSquerePosition)squerePosition
                 animated:(BOOL)animated
{
    [self setSquerePosition:squerePosition
                   animated:animated
          completionHandler:nil];
}

- (void)setSquerePosition:(ABSquerePosition)squerePosition
                 animated:(BOOL)animated
        completionHandler:(ABCompletionBlock)completionHandler
{
    [UIView animateWithDuration:animated ? ABAnimationDuration : 0
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationCurveEaseOut
                     animations:^{
                         self.squere.frame = [self squereFrameForPosition:squerePosition];
                         NSLog(@"squereOrigin%@", NSStringFromCGPoint(self.squere.frame.origin));
    }
                     completion:^(BOOL finished) {
                         if (completionHandler) {
                             completionHandler(finished);
                         }
                         _squerePosition = squerePosition;
                     }];
}

#pragma mark
#pragma mark - Public Methods

- (void)startRandomMoving {
    self.running = !self.running;
    [self setSquerePosition:[self randomPosition]
                   animated:YES];
}

- (void)startCycleMove {
    self.running = !self.running;
    [self startClockwiseMoving];
}

- (void)startClockwiseMoving {
    ABWeakify(self);
    [self setSquerePosition:[self nextPosition]
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

- (CGRect)squereFrameForPosition:(ABSquerePosition)position {
    CGRect squereFrame = self.squere.frame;
    CGPoint squerePoint = CGPointZero;
    
    CGFloat maxXPosition = self.frame.size.width - squereFrame.size.width;
    CGFloat maxYPosition = self.frame.size.height - squereFrame.size.height;
    
    switch (position) {
        case ABSquerePositionTopRight:
            squerePoint.x = maxXPosition;
            break;
            
        case ABSquerePositionBottomRight:
            squerePoint.x = maxXPosition;
            squerePoint.y = maxYPosition;
            break;
            
        case ABSquerePositionBottomLeft:
            squerePoint.y = maxYPosition;
            break;
            
        default:
            break;
    }
    squereFrame.origin = squerePoint;

    return squereFrame;
}

- (ABSquerePosition)nextPosition {
    return (self.squerePosition + 1) % ABSquerePositionCount;
}

- (ABSquerePosition)randomPosition {
    ABSquerePosition randomPosition = ABRandomWithMaxValue(ABSquerePositionCount);
    if (randomPosition == self.squerePosition) {
        [self randomPosition];
    }
    
    return randomPosition;
}

@end

