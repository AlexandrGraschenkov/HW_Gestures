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
@property BOOL onBot;
@property BOOL onTop;
@end

@implementation ViewController
@synthesize imgView;
@synthesize onBot;
@synthesize onTop;

- (void)viewDidLoad
{
    [super viewDidLoad];
    imgView.image=[UIImage imageNamed:@"gesture1.png"];
    onTop=YES;
    onBot=NO;
    // ниче нет, пусто!
}
-(IBAction)swipeDown:(UISwipeGestureRecognizer *)sender{
    if(!onBot){
        NSMutableArray *images=[NSMutableArray new];
        for(int i=2;i<10;i++){
            NSString *imgName=@"gesture";
            imgName=[imgName stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
            imgName=[imgName stringByAppendingString:@".png"];
            [images addObject:[UIImage imageNamed:imgName]];
            
        }
        NSArray *animationImages=[NSArray arrayWithArray:images];
        [imgView setAnimationImages:animationImages];
        [imgView setAnimationRepeatCount:1];
        [imgView setAnimationDuration:1];
        imgView.image=[UIImage imageNamed:@"gesture9.png"];
        [imgView startAnimating];
        onBot=YES;
        onTop=NO;
    }
}
-(IBAction)swipeUp:(UISwipeGestureRecognizer *)sender{
    
    if(!onTop){
        NSMutableArray *images=[NSMutableArray new];
        for(int i=10;i<16;i++){
            NSString *imgName=@"gesture";
            imgName=[imgName stringByAppendingString:[NSString stringWithFormat:@"%d",i]];
            imgName=[imgName stringByAppendingString:@".png"];
            [images addObject:[UIImage imageNamed:imgName]];
            
        }
        NSArray *animationImages=[NSArray arrayWithArray:images];
        [imgView setAnimationImages:animationImages];
        [imgView setAnimationRepeatCount:1];
        [imgView setAnimationDuration:1];
        imgView.image=[UIImage imageNamed:@"gesture1.png"];
        [imgView startAnimating];
        onBot=NO;
        onTop=YES;
    }
}

@end
