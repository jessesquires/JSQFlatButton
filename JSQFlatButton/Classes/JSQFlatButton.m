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
#import <QuartzCore/QuartzCore.h>

static CGFloat const kJSQColorAlphaDisabled = 0.75f;

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
                        title:(NSString *)title
                        image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        [self jsq_setup];
        [self setNormalBackgroundColor:backgroundColor];
        [self setNormalForegroundColor:foregroundColor];
        [self setFlatTitle:title];
        [self setFlatImage:image];
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
    
    _normalBorderColor = nil;
    _highlightedBorderColor = nil;
    _disabledBorderColor = nil;
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
        _disabledBackgroundColor = [_highlightedBackgroundColor colorWithAlphaComponent:kJSQColorAlphaDisabled];
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
        _disabledForegroundColor = [_highlightedForegroundColor colorWithAlphaComponent:kJSQColorAlphaDisabled];
    }
    
    [self jsq_refreshTitleAndImage];
}

- (void)setNormalBorderColor:(UIColor *)normalBorderColor
{
    self.layer.borderColor = normalBorderColor.CGColor;
    _normalBorderColor = normalBorderColor;
    
    if (!_highlightedBorderColor) {
        _highlightedBorderColor = [self jsq_lightenedColorFromColor:normalBorderColor];
    }
    
    if (!_disabledBorderColor) {
        _disabledBorderColor = [_highlightedBorderColor colorWithAlphaComponent:kJSQColorAlphaDisabled];
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

#pragma mark - JSQFlatButton

- (void)setFlatTitle:(NSString *)title
{
    if (!title) {
        [self setTitle:nil forState:UIControlStateNormal];
        return;
    }
    
    [self setTitle:title forState:UIControlStateNormal];
    
    [self setTitleColor:_normalForegroundColor forState:UIControlStateNormal];
    [self setTitleColor:_highlightedForegroundColor forState:UIControlStateHighlighted];
    [self setTitleColor:_disabledForegroundColor forState:UIControlStateDisabled];
}

- (void)setFlatImage:(UIImage *)image
{
    if (!image) {
        [self setImage:nil forState:UIControlStateNormal];
        return;
    }
    
    [self setImage:[self jsq_image:image maskedWithColor:_normalForegroundColor]
          forState:UIControlStateNormal];
    
    [self setImage:[self jsq_image:image maskedWithColor:_highlightedForegroundColor]
          forState:UIControlStateHighlighted];
    
    [self setImage:[self jsq_image:image maskedWithColor:_disabledForegroundColor]
          forState:UIControlStateDisabled];
}

#pragma mark - UIButton

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.backgroundColor = highlighted ? self.highlightedBackgroundColor : self.normalBackgroundColor;
    self.tintColor = highlighted ? self.highlightedForegroundColor : self.normalForegroundColor;
    self.layer.borderColor = highlighted ? self.highlightedBorderColor.CGColor : self.normalBorderColor.CGColor;
    [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    self.backgroundColor = enabled ? self.normalBackgroundColor : self.disabledBackgroundColor;
    self.tintColor = enabled ? self.normalForegroundColor : self.disabledForegroundColor;
    self.layer.borderColor = enabled ? self.normalBorderColor.CGColor : self.disabledBorderColor.CGColor;
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
    CGContextTranslateCTM(context, 0.0f, -imageRect.size.height);

    CGContextClipToMask(context, imageRect, image.CGImage);
    CGContextSetFillColorWithColor(context, maskColor.CGColor);
    CGContextFillRect(context, imageRect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end