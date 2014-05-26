//
//  ViewController.m
//  TestGesture
//
//  Created by Alexander on 28.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property BOOL lionIsWatching;
@property BOOL onTop;
@property NSArray *animationImages;
@property NSArray *animationImagesReversed;
@end

@implementation ViewController
@synthesize imageView;
@synthesize lionIsWatching;

#define START_POSITION 2
#define END_POSITION 10

-(void)viewDidLoad
{
    [super viewDidLoad];
    imageView.image=[UIImage imageNamed:@"gesture1.png"];
    lionIsWatching=NO;
    
    
    NSMutableArray *images = [NSMutableArray new];
    NSMutableArray *imagesReversed = [NSMutableArray new];
    for(int i = START_POSITION; i < END_POSITION; i++) {
        NSString *imgName = @"gesture";
        imgName = [imgName stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
        imgName = [imgName stringByAppendingString:@".png"];
        [images addObject:[UIImage imageNamed:imgName]];
        
        imgName = @"gesture";
        imgName = [imgName stringByAppendingString:[NSString stringWithFormat:@"%d", END_POSITION - i + START_POSITION]];
        imgName = [imgName stringByAppendingString:@".png"];
        [imagesReversed addObject:[UIImage imageNamed:imgName]];
    }
    self.animationImages=[NSArray arrayWithArray:images];
    self.animationImagesReversed = [NSArray arrayWithArray:imagesReversed];
}

-(IBAction)swipeDown:(UISwipeGestureRecognizer *)sender{
    if(!lionIsWatching){
        [imageView setAnimationImages:self.animationImages];
        [imageView setAnimationRepeatCount:1];
        [imageView setAnimationDuration:0.2];
        imageView.image=[UIImage imageNamed:@"gesture9.png"];
        [imageView startAnimating];
        lionIsWatching = !lionIsWatching;
    }
}

-(IBAction)swipeUp:(UISwipeGestureRecognizer *)sender{
    if(lionIsWatching){
        [imageView setAnimationImages:self.animationImagesReversed];
        [imageView setAnimationRepeatCount:1];
        [imageView setAnimationDuration:0.2];
        imageView.image=[UIImage imageNamed:@"gesture1.png"];
        [imageView startAnimating];
        lionIsWatching = !lionIsWatching;
    }
}

@end
