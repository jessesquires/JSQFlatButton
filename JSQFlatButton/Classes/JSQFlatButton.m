//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2013 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "JSQFlatButton.h"

@interface JSQFlatButton ()

- (void)jsq_setup;

- (void)jsq_refreshTitleAndImage;

- (UIColor *)jsq_darkenedColorFromColor:(UIColor *)color;
- (UIColor *)jsq_lightenedColorFromColor:(UIColor *)color;

- (UIImage *)jsq_image:(UIImage *)image maskedWithColor:(UIColor *)maskColor;

@end



@implementation JSQFlatButton

#pragma mark - Initialization

- (void)jsq_setup
{
    self.showsTouchWhenHighlighted = NO;
    self.adjustsImageWhenHighlighted = NO;
    self.adjustsImageWhenDisabled = NO;
    self.titleLabel.shadowOffset = CGSizeZero;
}

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              foregroundColor:(UIColor *)foregroundColor
{
    self = [super initWithFrame:frame];
    if (self) {
        [self jsq_setup];
        [self setNormalBackgroundColor:backgroundColor];
        [self setNormalForegroundColor:foregroundColor];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self jsq_setup];
    }
    return self;
}

- (void)dealloc
{
    _normalBackgroundColor = nil;
    _highlightedBackgroundColor = nil;
    _disabledBackgroundColor = nil;
    
    _normalForegroundColor = nil;
    _highlightedForegroundColor = nil;
    _disabledForegroundColor = nil;
}

#pragma mark - Setters

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor
{
    self.backgroundColor = normalBackgroundColor;
    _normalBackgroundColor = normalBackgroundColor;
    
    if (!_highlightedBackgroundColor) {
        _highlightedBackgroundColor = [self jsq_darkenedColorFromColor:normalBackgroundColor];
    }
    
    if (!_disabledBackgroundColor) {
        _disabledBackgroundColor = [_highlightedBackgroundColor colorWithAlphaComponent:0.75f];
    }
    
    [self jsq_refreshTitleAndImage];
}

- (void)setNormalForegroundColor:(UIColor *)normalForegroundColor
{
    self.tintColor = normalForegroundColor;
    _normalForegroundColor = normalForegroundColor;
    
    if (!_highlightedForegroundColor) {
        _highlightedForegroundColor = [self jsq_lightenedColorFromColor:normalForegroundColor];
    }
    
    if (!_disabledForegroundColor) {
        _disabledForegroundColor = [_highlightedForegroundColor colorWithAlphaComponent:0.75f];
    }
    
    [self jsq_refreshTitleAndImage];
}

#pragma mark - JSQFlatButton

- (void)setFlatTitle:(NSString *)title
{
    if (!title) {
        return;
    }
    
    [self setTitle:title forState:UIControlStateNormal];
    
    [self setTitleColor:self.normalForegroundColor forState:UIControlStateNormal];
    [self setTitleColor:self.highlightedForegroundColor forState:UIControlStateHighlighted];
    [self setTitleColor:self.disabledForegroundColor forState:UIControlStateDisabled];
}

- (void)setFlatImage:(UIImage *)image
{
    if (!image) {
        return;
    }
    
    [self setImage:[self jsq_image:image maskedWithColor:self.normalForegroundColor]
          forState:UIControlStateNormal];
    
    [self setImage:[self jsq_image:image maskedWithColor:self.highlightedForegroundColor]
          forState:UIControlStateHighlighted];
    
    [self setImage:[self jsq_image:image maskedWithColor:self.disabledForegroundColor]
          forState:UIControlStateDisabled];
}

#pragma mark - UIButton

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.backgroundColor = highlighted ? self.highlightedBackgroundColor : self.normalBackgroundColor;
    self.tintColor = highlighted ? self.highlightedForegroundColor : self.normalForegroundColor;
    [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    self.backgroundColor = enabled ? self.normalBackgroundColor : self.disabledBackgroundColor;
    self.tintColor = enabled ? self.normalForegroundColor : self.disabledForegroundColor;
    [self setNeedsDisplay];
}

#pragma mark - Utilities

- (void)jsq_refreshTitleAndImage
{
    [self setFlatTitle:self.titleLabel.text];
    [self setFlatImage:self.imageView.image];
}

- (UIColor *)jsq_darkenedColorFromColor:(UIColor *)color
{
    CGFloat h,s,b,a;
    [color getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 0.85f alpha:a];
}

- (UIColor *)jsq_lightenedColorFromColor:(UIColor *)color
{
    CGFloat h,s,b,a;
    [color getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 1.15f alpha:a];
}

- (UIImage *)jsq_image:(UIImage *)image maskedWithColor:(UIColor *)maskColor
{
    CGRect imageRect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(context, 1.0f, -1.0f);
    CGContextTranslateCTM(context, 0.0f, -(imageRect.size.height));

    CGContextClipToMask(context, imageRect, image.CGImage);
    CGContextSetFillColorWithColor(context, maskColor.CGColor);
    CGContextFillRect(context, imageRect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end