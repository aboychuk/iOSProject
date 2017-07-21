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

static BOOL ABAnimatedDefault               = YES;
static NSTimeInterval ABAnimationDuration   = 1;
static NSUInteger positionCount             = 4;

@interface ABSquereView ()
@property (nonatomic, assign, getter=isRunnin) BOOL    running;

- (ABSquerePosition)moveToNextPosition;
- (ABSquerePosition)moveToRandomPosition;
- (CGRect)squreFramePosition:(ABSquerePosition)squerePosition;
- (CGPoint)squereOriginPosition:(ABSquerePosition)position;

@end

@implementation ABSquereView

#pragma mark
#pragma mark - Accessors

- (void)setSquerePosition:(ABSquerePosition)squerePosition {
    [self setSquerePosition:squerePosition
                   animated:ABAnimatedDefault];
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
        completionHandler:(ABVoidBlock)handler
{
    [UIView animateWithDuration:ABAnimationDuration
                     animations:^{
                         self.squere.frame = [self squreFramePosition:squerePosition];
                         NSLog(@"squereOrigin%@", NSStringFromCGPoint(self.squere.frame.origin));

    }
                     completion:^(BOOL finished) {
                         if (handler) {
                             handler();
                         }
                         _squerePosition = squerePosition;

                     }];
    
}

#pragma mark
#pragma mark - Public Methods

- (void)startClockwiseMoving {
    ABWeakify(self);
    self.running = YES;
    [self setSquerePosition:[self moveToNextPosition]
                   animated:ABAnimatedDefault
          completionHandler:^{
              ABStrongify(self);
              if ([self isRunnin]) {
                  [self startClockwiseMoving];
              } else {
                  self.running = NO;
              }
          }];
}

- (void)startRandomMoving {
    self.running = YES;
    [self setSquerePosition:[self moveToRandomPosition]
                   animated:YES];
}

#pragma mark
#pragma mark - Private Methods

- (CGPoint)squereOriginPosition:(ABSquerePosition)position {
    CGPoint squerePoint = self.squere.bounds.origin;
    CGFloat maxXPosition = self.frame.size.width - self.squere.frame.size.width;
    CGFloat maxYPosition = self.frame.size.height - self.squere.frame.size.height;
    CGFloat zero = 0;
    
    
    switch (position) {
        case ABSquerePositionTopLeft:
            return squerePoint;
            break;
            
        case ABSquerePositionTopRight:
            return CGPointMake(maxXPosition, zero);
            break;
            
        case ABSquerePositionBottomRight:
            return CGPointMake(maxXPosition, maxYPosition);
            break;
        
        case ABSquerePositionBottomLeft:
            return CGPointMake(zero, maxYPosition);
            break;
            
        default:
            break;
    }
    
    return squerePoint;
}

- (CGRect)squreFramePosition:(ABSquerePosition)squerePosition {
    CGRect squereFrame = self.squere.frame;
    squereFrame.origin = [self squereOriginPosition:squerePosition];
    return squereFrame;
}

- (ABSquerePosition)moveToNextPosition {
    return (self.squerePosition + 1) % positionCount;
}

- (ABSquerePosition)moveToRandomPosition {
    if ([self isRunnin]) {
        self.running = NO;
    }
    return ABRandomWithMaxValue(positionCount);
}

@end

