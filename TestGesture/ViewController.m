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
@property(nonatomic) CGFloat startHeight;
@property(nonatomic) CGFloat endHeight;
@property(nonatomic) int diff;
@end

@implementation ViewController
@synthesize imgView;
@synthesize startHeight;
@synthesize endHeight;
@synthesize diff;

- (void)viewDidLoad
{
    [super viewDidLoad];
    imgView.image =[UIImage imageNamed:@"gesture1.png"];

    
}




- (IBAction)swipe:(UIPanGestureRecognizer *)sender {
     diff = 1;
    if (sender.state == UIGestureRecognizerStateBegan){
         startHeight = [sender locationInView:self.view].y/18;
    }
    else
        if (sender.state == UIGestureRecognizerStateChanged){
            endHeight = [sender locationInView:self.view].y/18;
            diff =(abs)((int) (endHeight - startHeight));
                if (diff == 0){
                    diff = 1;
                }
                else if (diff>12){
                    diff = 12;
                }
           // NSLog(@"%d",diff);

            imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gesture%d.png",diff]];
        }
 
    

    
}

@end
