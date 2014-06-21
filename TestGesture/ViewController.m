//
//  ViewController.m
//  TestGesture
//
//  Created by Alexander on 28.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation ViewController
@synthesize imgView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    imgView.image = [UIImage imageNamed:@"gesture1.png"];
}

- (IBAction)action:(UIPanGestureRecognizer *)sender
{
    int img = 1;
    if (sender.state == UIGestureRecognizerStateChanged) {
        img = [sender locationInView:self.imgView].y/40;
        //NSLog(@"%f", [sender locationInView:self.imgView].y);
        if(img < 1) {
            img = 1;
        } else if (img > 12) {
            img = 12;
        }
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gesture%d.png",img]];
    }
}

@end