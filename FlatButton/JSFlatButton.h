//
//  JSFlatButton.h
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+JSFlatButton.h"
#import "UIImage+JSFlatButton.h"

@interface JSFlatButton : UIButton

@property (strong, nonatomic) UIColor *buttonBackgroundColor;
@property (strong, nonatomic) UIColor *buttonForegroundColor;
@property (assign, nonatomic) BOOL shouldHighlightImage;

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)back
    foregroundColor:(UIColor *)fore;

#pragma mark - Appearance
- (void)setFlatTitle:(NSString *)title;
- (void)setFlatImage:(UIImage *)image;

@end