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
    
    self.button1.buttonBackgroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:0.60f alpha:1.0f];
    self.button1.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.button1.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    [self.button1 setFlatTitle:@"  Press Me"];
    [self.button1 setFlatImage:[UIImage imageNamed:@"arrow_right"]];
    
    self.button2.buttonBackgroundColor = [UIColor colorWithRed:255.0/255.0 green:246.0/255.0 blue:150.0/255.0 alpha:1.0];
    self.button2.buttonForegroundColor = [UIColor colorWithRed:106.0/255.0 green:183.0/255.0 blue:197.0/255.0 alpha:1.0];
    self.button2.titleLabel.font = [UIFont boldSystemFontOfSize:26.0f];
    [self.button2 setFlatTitle:@"  Play"];
    [self.button2 setFlatImage:[UIImage imageNamed:@"play"]];
    
    self.button3.buttonBackgroundColor = [UIColor colorWithRed:231.0/255.0 green:110.0/255.0 blue:121.0/255.0 alpha:1.0];
    self.button3.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.button3.titleLabel.font = [UIFont fontWithName:@"Arial" size:34.0f];
    self.button3.titleLabel.numberOfLines = 2;
    self.button3.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.button3 setFlatTitle:@"FLAT\nDESIGN"];
    [self.button3 setFlatImage:nil];
    
    self.button4.buttonBackgroundColor = nil;
    self.button4.shouldHighlightImage = YES;
    self.button4.buttonForegroundColor = [UIColor colorWithRed:244.0/255.0 green:153.0/255.0 blue:108.0/255.0 alpha:1.0];
    [self.button4 setFlatTitle:nil];
    [self.button4 setFlatImage:[UIImage imageNamed:@"plus"]];
    
    self.button5.buttonBackgroundColor = [UIColor colorWithRed:244.0/255.0 green:153.0/255.0 blue:108.0/255.0 alpha:1.0];
    self.button5.buttonForegroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    [self.button5 setFlatTitle:nil];
    [self.button5 setFlatImage:[UIImage imageNamed:@"plus"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end