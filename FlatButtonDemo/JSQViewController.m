//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2013 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "JSQViewController.h"

@implementation JSQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.button0.normalBackgroundColor = [UIColor colorWithRed:1.0f green:0.22f blue:0.22f alpha:1.0f];
    self.button0.normalForegroundColor = [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f];
    [self.button0 setFlatTitle:@"  Play"];
    [self.button0 setFlatImage:[UIImage imageNamed:@"play"]];
    
    
    self.button1.normalBackgroundColor = [UIColor colorWithRed:1.0f green:0.79f blue:0.28f alpha:1.0f];
    self.button1.normalForegroundColor = [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f];
    [self.button1 setFlatTitle:@"  Pause"];
    [self.button1 setFlatImage:[UIImage imageNamed:@"pause"]];
    
    
    self.button2.normalBackgroundColor = [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f];
    self.button2.normalForegroundColor = [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f];
    [self.button2 setFlatTitle:@"  Shuffle"];
    [self.button2 setFlatImage:[UIImage imageNamed:@"shuffle"]];
    
    
    self.button3.normalBackgroundColor = [UIColor clearColor];
    self.button3.normalForegroundColor = [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f];
    [self.button3 setFlatTitle:@"Text only"];
    [self.button3 setFlatImage:nil];
    
    
    self.button4.normalBackgroundColor = [UIColor clearColor];
    self.button4.normalForegroundColor = [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f];
    [self.button4 setFlatTitle:nil];
    [self.button4 setFlatImage:[UIImage imageNamed:@"play"]];
    
    
    self.button5.normalBackgroundColor = [UIColor colorWithHue:0.0f saturation:0.0f brightness:1.0f alpha:1.0f];
    self.button5.normalForegroundColor = [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f];
    [self.button5 setFlatTitle:@"Border & Rounded"];
    [self.button5 setFlatImage:nil];
    self.button5.layer.cornerRadius = 8.0f;
    self.button5.layer.borderColor = [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f].CGColor;
    self.button5.layer.borderWidth = 1.0f;
}

@end
