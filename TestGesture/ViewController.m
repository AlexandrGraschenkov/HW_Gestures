//
//  ViewController.m
//  TestGesture
//
//  Created by Alexander on 28.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat startHeight;
    CGFloat sectionHeight;
    int imageNumb;
    int startNumb;
}
@property (nonatomic, weak) IBOutlet UIImageView *imgView;

@end

@implementation ViewController
@synthesize imgView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    imageNumb = 1;
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gesture%d", imageNumb]];
    sectionHeight = self.view.frame.size.height / 20;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    sectionHeight = self.view.frame.size.height / 20;
}

- (IBAction)swipe:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        startHeight = [sender locationInView:self.view].y;
        startNumb = imageNumb;
    }
    else if (sender.state == UIGestureRecognizerStateChanged)
    {
        int currentDelta = (int)(([sender locationInView:self.view].y - startHeight) / sectionHeight);
        imageNumb = startNumb + currentDelta;
        if (imageNumb < 1)
        {
            imageNumb = 1;
        }
        else if (imageNumb > 15)
        {
            imageNumb = 15;
        }
        if (currentDelta != 0)
        {
            imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gesture%d", imageNumb]];
        }
    }
}

@end
