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

@property (strong, nonatomic) UIColor *backgroundHighlightedColor;
@property (strong, nonatomic) UIColor *foregroundHighlightedColor;

- (void)setup;
- (void)refreshTitleAndImage;

- (UIColor *)darkenedColorFromColor:(UIColor *)color;
- (UIColor *)lightenedColorFromColor:(UIColor *)color;

@end



@implementation JSQFlatButton

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
    backgroundHighlightedColor = [self darkenedColorFromColor:color];
    [self refreshTitleAndImage];
}

- (void)setButtonForegroundColor:(UIColor *)color
{
    buttonForegroundColor = color;
    foregroundHighlightedColor = [self darkenedColorFromColor:color];
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
    image = [self image:image maskedWithColor:self.buttonForegroundColor];
  
    [self setImage:image forState:UIControlStateNormal];
    
    if(self.shouldHighlightImage) {
        image = [self image:image maskedWithColor:self.foregroundHighlightedColor];
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

- (UIColor *)darkenedColorFromColor:(UIColor *)color
{
    CGFloat h,s,b,a;
    [color getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 0.85f alpha:a];
}

- (UIColor *)lightenedColorFromColor:(UIColor *)color
{
    CGFloat h,s,b,a;
    [color getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 1.15f alpha:a];
}

- (UIImage *)image:(UIImage *)image maskedWithColor:(UIColor *)maskColor
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