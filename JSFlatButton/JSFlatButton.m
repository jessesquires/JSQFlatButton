//
//  JSFlatButton.m
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//
//  http://www.hexedbits.com
//
//  The MIT License
//  Copyright (c) 2013 Jesse Squires
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
//  associated documentation files (the "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
//  following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
//  LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "JSFlatButton.h"

@interface JSFlatButton ()

@property (strong, nonatomic) UIColor *backgroundHighlightedColor;
@property (strong, nonatomic) UIColor *foregroundHighlightedColor;

- (void)setup;
- (void)refreshTitleAndImage;

@end



@implementation JSFlatButton

@synthesize buttonBackgroundColor;
@synthesize backgroundHighlightedColor;
@synthesize buttonForegroundColor;
@synthesize foregroundHighlightedColor;
@synthesize shouldHighlightText;
@synthesize shouldHighlightImage;

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)back foregroundColor:(UIColor *)fore
{
    self = [super initWithFrame:frame];
    if(self) {
        self.buttonBackgroundColor = back;
        self.buttonForegroundColor = fore;
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self setup];
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

- (void)setShouldHighlightText:(BOOL)highlight
{
    shouldHighlightText = highlight;
    [self refreshTitleAndImage];
}

- (void)setShouldHighlightImage:(BOOL)highlight
{
    shouldHighlightImage = highlight;
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
    
    [self setTitleColor:(self.shouldHighlightText ? self.foregroundHighlightedColor : self.buttonForegroundColor)
               forState:UIControlStateHighlighted];
}

- (void)setFlatImage:(UIImage *)image
{
    image = [image imageMaskWithColor:self.buttonForegroundColor
                         shadowOffset:CGPointMake(0.0f, 0.0f)];
  
    [self setImage:image forState:UIControlStateNormal];
    
    if(self.shouldHighlightImage) {
        image = [image imageMaskWithColor:self.foregroundHighlightedColor
                             shadowOffset:CGPointMake(0.0f, 0.0f)];
    }
    
    [self setImage:image forState:UIControlStateHighlighted];
}

#pragma mark - Utilities
- (void)setup
{
    self.shouldHighlightText = NO;
    self.shouldHighlightImage = NO;
}

- (void)refreshTitleAndImage
{
    [self setFlatTitle:self.titleLabel.text];
    [self setFlatImage:self.imageView.image];
}

@end