//
//  JSFlatButton.m
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "JSFlatButton.h"

@interface JSFlatButton ()

@property (strong, nonatomic) UIColor *backgroundHighlightedColor;
@property (strong, nonatomic) UIColor *foregroundHighlightedColor;

- (void)refreshTitleAndImage;

@end



@implementation JSFlatButton

@synthesize buttonBackgroundColor;
@synthesize backgroundHighlightedColor;
@synthesize buttonForegroundColor;
@synthesize foregroundHighlightedColor;

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)back foregroundColor:(UIColor *)fore
{
    self = [super initWithFrame:frame];
    if(self) {
        self.buttonBackgroundColor = back;
        self.buttonForegroundColor = fore;
        self.shouldHighlightImage = NO;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        self.shouldHighlightImage = NO;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.shouldHighlightImage = NO;
    }
    return self;
}

#pragma mark - Setters
- (void)setButtonBackgroundColor:(UIColor *)color
{
    self.backgroundColor = color;
    buttonBackgroundColor = color;
    backgroundHighlightedColor = [color darkenedColor];
    [self refreshTitleAndImage];
}

- (void)setButtonForegroundColor:(UIColor *)color
{
    buttonForegroundColor = color;
    foregroundHighlightedColor = [color darkenedColor];
    [self refreshTitleAndImage];
}

#pragma mark - Parent overrides
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.backgroundColor = highlighted ? backgroundHighlightedColor : buttonBackgroundColor;
    [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    self.backgroundColor = enabled ? buttonBackgroundColor : backgroundHighlightedColor;
    [self setNeedsDisplay];
}

#pragma mark - Appearance
- (void)setFlatTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
    
    [self setTitleColor:self.buttonForegroundColor forState:UIControlStateNormal];
    [self setTitleColor:self.buttonForegroundColor forState:UIControlStateHighlighted];
}

- (void)setFlatImage:(UIImage *)image
{
    image = [image imageMaskWithColor:self.buttonForegroundColor
                         shadowOffset:CGPointMake(0, 0)];
  
    [self setImage:image forState:UIControlStateNormal];
    
    if(self.shouldHighlightImage) {
        image = [image imageMaskWithColor:self.foregroundHighlightedColor
                             shadowOffset:CGPointMake(0, 0)];
    }
    
    [self setImage:image forState:UIControlStateHighlighted];
}

#pragma mark - Utilities
- (void)refreshTitleAndImage
{
    [self setFlatTitle:self.titleLabel.text];
    [self setFlatImage:self.imageView.image];
}

@end