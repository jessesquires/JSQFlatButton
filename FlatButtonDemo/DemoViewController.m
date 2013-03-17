//
//  DemoViewController.m
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end



@implementation DemoViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    self.button1.buttonBackgroundColor = [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f]; //[UIColor colorWithHue:0.0f saturation:0.0f brightness:0.60f alpha:1.0f];
    self.button1.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.button1.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    [self.button1 setFlatTitle:@"  Press Me"];
    [self.button1 setFlatImage:[UIImage imageNamed:@"arrow_up"]];
    
    self.button2.buttonBackgroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f]; //[UIColor colorWithRed:255.0f/255.0f green:246.0f/255.0f blue:150.0f/255.0f alpha:1.0f];
    self.button2.buttonForegroundColor = [UIColor colorWithRed:0.18f green:0.59f blue:0.71f alpha:1.00f]; //[UIColor colorWithRed:106.0f/255.0f green:183.0f/255.0f blue:197.0f/255.0f alpha:1.0f];
    self.button2.titleLabel.font = [UIFont boldSystemFontOfSize:26.0f];
    [self.button2 setFlatTitle:@"  Tap Tap"];
    [self.button2 setFlatImage:[UIImage imageNamed:@"graph_bar"]];
    
    self.button3.buttonBackgroundColor = [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1.00f]; //[UIColor colorWithRed:231.0f/255.0f green:110.0f/255.0f blue:121.0f/255.0f alpha:1.0f];
    self.button3.buttonForegroundColor = [UIColor colorWithRed:255.0f/255.0f green:246.0f/255.0f blue:150.0f/255.0f alpha:1.0f]; //[UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.button3.titleLabel.font = [UIFont fontWithName:@"Arial" size:34.0f];
    self.button3.titleLabel.numberOfLines = 2;
    self.button3.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button3 setFlatTitle:@"FLAT\nDESIGN"];
    [self.button3 setFlatImage:nil];
    
    self.button4.buttonBackgroundColor = nil;
    self.button4.shouldHighlightImage = YES;
    self.button4.buttonForegroundColor = [UIColor colorWithRed:244.0f/255.0f green:153.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
    [self.button4 setFlatTitle:nil];
    [self.button4 setFlatImage:[UIImage imageNamed:@"shuffle"]];
    
    self.button5.buttonBackgroundColor = [UIColor colorWithRed:244.0f/255.0f green:153.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
    self.button5.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    [self.button5 setFlatTitle:nil];
    [self.button5 setFlatImage:[UIImage imageNamed:@"record"]];
    
    self.button6.buttonBackgroundColor = nil;
    self.button6.shouldHighlightText = YES;
    self.button6.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.60f alpha:1.0f];
    [self.button6 setFlatTitle:@"Text Only Button"];
    self.button6.titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
    [self.button6 setFlatImage:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end