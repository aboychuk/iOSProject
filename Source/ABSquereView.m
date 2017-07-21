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

static BOOL ABAnimatedDefault               = NO;
static NSTimeInterval ABAnimationDuration   = 5;
static NSUInteger positionCount             = 4;

@interface ABSquereView ()
@property (nonatomic, assign, getter=isStarted) BOOL    started;

- (ABSquerePosition)moveToNextPosition;
- (ABSquerePosition)moveToRandomPosition;

@end

@implementation ABSquereView

#pragma mark
#pragma mark - Accessors

- (void)setSquerePosition:(ABSquerePosition)squerePosition {
    [self setSquerePosition:squerePosition animated:ABAnimatedDefault];
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
                         self.squere.frame = [self squereOriginPosition:squerePosition];
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
    self.started = YES;
    [self setSquerePosition:[self moveToNextPosition]
                   animated:ABAnimatedDefault
          completionHandler:^{
              ABStrongify(self);
              [self startClockwiseMoving];
          }];
}

- (void)startRandomMoving {
    [self setSquerePosition:[self moveToRandomPosition]
                   animated:YES];
}

- (void)stopMoving {
    [self setSquerePosition:ABSquerePositionTopLeft
                   animated:YES];
}

#pragma mark
#pragma mark - Private Methods

- (CGRect)squereOriginPosition:(ABSquerePosition)position {
//    CGPoint squerePoint = self.squere.bounds.origin;
    CGFloat squereHeight = self.squere.bounds.size.height;
    CGFloat squereWidth = self.squere.bounds.size.width;
    
    CGFloat topX = self.frame.size.width - self.squere.frame.size.width;
    CGFloat bottomY = self.frame.size.height - self.squere.frame.size.height;
    CGFloat zero = 0;
    CGRect squere = CGRectMake(zero, zero, squereWidth, squereHeight);
    
    
    switch (position) {
        case ABSquerePositionTopLeft:
            return squere;
            break;
            
        case ABSquerePositionTopRight:
            return squere = CGRectMake(topX, zero, squereWidth, squereHeight);
            break;
            
        case ABSquerePositionBottomRight:
            return squere = CGRectMake(topX, bottomY, squereWidth, squereHeight);
            break;
        
        case ABSquerePositionBottomLeft:
            return squere = CGRectMake(zero, bottomY, squereWidth, squereHeight);
            break;
            
        default:
            break;
    }
    
    return squere;
}

- (ABSquerePosition)moveToNextPosition {
    if ([self isStarted]) {
        
    }
    return (self.squerePosition + 1) % positionCount;
}

- (ABSquerePosition)moveToRandomPosition {
    return ABRandomWithMaxValue(positionCount);
}

@end

