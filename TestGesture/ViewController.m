//
//  ViewController.m
//  TestGesture
//
//  Created by Alexander on 28.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@end

@implementation ViewController {
    NSUInteger currentFrame;
    NSArray *frames;
    
    NSArray *sectorCoef;
}
@synthesize imgView;

- (void)viewDidLoad {
    [super viewDidLoad];
    currentFrame = 0;
    
    NSMutableArray *loadFrames = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        UIImage *frame = [UIImage imageNamed:[NSString stringWithFormat:@"img%d.png", i]];
        [loadFrames addObject:frame];
    }
    
    frames = [NSArray arrayWithArray:loadFrames];
    
    sectorCoef = @[@0,
                   @0.025,
                   @0.05,
                   @0.075,
                   @0.1,
                   @0.125,
                   @0.15,
                   @0.29,
                   @0.43,
                   @0.57,
                   @0.71,
                   @0.85,
                   @0.865,
                   @0.88,
                   @0.895,
                   @0.91,
                   @0.925,
                   @0.955,
                   @0.97,
                   @0.985];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self showFrameAtIndex:0];
}

- (void)showFrameAtIndex:(NSUInteger)index {
    if (index >= 20) {
        return;
    }
    
    [imgView setImage:[frames objectAtIndex:index]];
    currentFrame = index;
}

- (NSUInteger)getIndexForVerticalPosition:(CGFloat)position {
    NSUInteger index = 0;
    CGFloat coef = position/self.imgView.frame.size.height;
    for (NSUInteger i = 0; i < 20; i++) {
        if (coef >= [sectorCoef[i] floatValue]) {
            index = i;
        } else {
            break;
        }
    }
    return index;
}

- (void)animateOohh:(BOOL)oohh {
    if (oohh) {
        int k = 0;
        for (NSInteger i = currentFrame-1; i >= 0; i--) {
            NSTimeInterval delay = 1.0/20*k;
            k++;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self showFrameAtIndex:i];
            });
        }
    } else {
        int k = 0;
        for (NSInteger i = currentFrame+1; i < 20; i++) {
            NSTimeInterval delay = 1.0/20*k;
            k++;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self showFrameAtIndex:i];
            });
        }
    }
}

- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)recognizer {
    switch ([recognizer state]) {
        case UIGestureRecognizerStateBegan:
            break;
        
        case UIGestureRecognizerStateChanged: {
            CGPoint currentPoint = [recognizer locationInView:self.view];
            
            [self showFrameAtIndex:[self getIndexForVerticalPosition:currentPoint.y]];
        }
            break;
        
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed: {
            CGPoint currentPoint = [recognizer locationInView:self.view];
            
            if (currentPoint.y >= self.imgView.frame.size.height/2) {
                [self animateOohh:NO];
            } else {
                [self animateOohh:YES];
            }
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)Oohh:(id)sender {
    [self animateOohh:YES];
}

- (IBAction)Aahh:(id)sender {
    [self animateOohh:NO];
}

@end
