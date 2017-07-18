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

static BOOL ABSquereAnimation               = YES;
static NSTimeInterval ABAnimationDuration   = 2;
static NSUInteger positionCount             = 4;

@interface ABSquereView ()
- (ABSquerePosition)moveToNextPosition;
- (ABSquerePosition)moveToRandomPosition;

@end

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
    [UIView animateWithDuration:ABAnimationDuration
                     animations:^{
                        CGRect squereOrigin = self.squere.frame;
                         squereOrigin.origin = [self squereOriginPosition:squerePosition];
                         self.squere.frame = squereOrigin;

    }
                     completion:^(BOOL finished) {
                         _squerePosition = squerePosition;

                         if (handler) {
                             handler();
                         }
                     }];
    
}

#pragma mark
#pragma mark - Public Methods

- (void)startClockwiseMoving {
    ABWeakify(self);
    [self setSquerePosition:[self moveToNextPosition]
                   animated:ABSquereAnimation
          completionHandler:^{
              ABStrongify(self);
              [self startClockwiseMoving];
          }];
}

- (void)startRandomMoving {
    ABWeakify(self);
    [self setSquerePosition:[self moveToRandomPosition]
                       animated:ABSquereAnimation
              completionHandler:^{
                  ABStrongify(self);
                  [self startClockwiseMoving];
              }];
}


#pragma mark
#pragma mark - Private Methods

- (CGPoint)squereOriginPosition:(ABSquerePosition)position {
    CGPoint squerePoint = self.squere.bounds.origin;
    
    CGFloat topX = self.frame.size.width - self.squere.frame.size.width;
    CGFloat bottomY = self.frame.size.height - self.squere.frame.size.height;
    CGFloat zero = 0;
    
    switch (position) {
        case ABSquerePositionTopLeft:
            return squerePoint;
            break;
            
        case ABSquerePositionTopRight:
            return CGPointMake(topX, zero);
            break;
            
        case ABSquerePositionBottomRight:
            return CGPointMake(topX, bottomY);
            break;
        
        case ABSquerePositionBottomLeft:
            return CGPointMake(zero, bottomY);
            break;
            
        default:
            break;
    }
    
    return squerePoint;
}

- (ABSquerePosition)moveToNextPosition {
    return (self.squerePosition + 1) % positionCount;
}

- (ABSquerePosition)moveToRandomPosition {
    return ABRandomWithMaxValue(positionCount);
}

@end

