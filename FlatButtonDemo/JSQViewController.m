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
    
    self.button0.normalBackgroundColor = [UIColor colorWithHue:1.0f saturation:0.67f brightness:0.98f alpha:1.0f];
    self.button0.normalForegroundColor = [UIColor colorWithHue:0.29f saturation:0.78f brightness:0.89f alpha:1.0f];
    [self.button0 setFlatTitle:@"Play"];
    [self.button0 setFlatImage:[UIImage imageNamed:@"play"]];
    self.button0.enabled = NO;
}

@end
