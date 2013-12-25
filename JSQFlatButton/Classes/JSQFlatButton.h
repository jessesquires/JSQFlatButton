//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  The MIT License
//  Copyright (c) 2013 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>

/**
 *  An instance of `JSQFlatButton` is a subclass of `UIButton` with a customized, flat appearance.
 */
@interface JSQFlatButton : UIButton

/**
 *  The background color of the button in its default state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *normalBackgroundColor;

/**
 *  The background color of the button in its highlighted state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *highlightedBackgroundColor;

/**
 *  The background color of the button in its disabled state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *disabledBackgroundColor;

/**
 *  The foreground color (the text color and image mask color) of the button in its default state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *normalForegroundColor;

/**
 *  The foreground color (the text color and image mask color) of the button in its highlighted state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *highlightedForegroundColor;

/**
 *  The foreground color (the text color and image mask color) of the button in its disabled state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *disabledForegroundColor;

/**
 *  The border color of the button in its default state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *normalBorderColor;

/**
 *  The border color of the button in its hightlighted state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *highlightedBorderColor;

/**
 *  The border color of the button in its disabled state. The default value is `nil`.
 */
@property (strong, nonatomic) UIColor *disabledBorderColor;

/**
 *  The corner radius of the button. The default value is `0.0f`.
 */
@property (assign, nonatomic) CGFloat cornerRadius;

/**
 *  The border width of the button. The default value is `0.0f`.
 */
@property (assign, nonatomic) CGFloat borderWidth;

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              foregroundColor:(UIColor *)foregroundColor;

#pragma mark - Setters

- (void)setFlatTitle:(NSString *)title;

- (void)setFlatImage:(UIImage *)image;

@end