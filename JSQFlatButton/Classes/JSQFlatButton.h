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
 *  
 *  @warning If the current value of highlightedBackgroundColor is `nil`, then setting this property also sets highlightedBackgroundColor to the same color value with a darkened brightness value. 
 *
 *  @warning If the current value of disabledBackgroundColor is `nil`, then setting this property also sets disabledBackgroundColor to the same color value with a darkened brightness value and alpha value of `0.75f`.
 *
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
 *
 *  @warning If the current value of highlightedForegroundColor is `nil`, then setting this property also sets highlightedForegroundColor to the same color value with a lightened brightness value.
 *
 *  @warning If the current value of disabledForegroundColor is `nil`, then setting this property also sets disabledForegroundColor to the same color value with a lightened brightness value and alpha value of `0.75f`.
 *
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
 *
 *  @warning If the current value of highlightedBorderColor is `nil`, then setting this property also sets highlightedBorderColor to the same color value with a lightened brightness value.
 *
 *  @warning If the current value of disabledBorderColor is `nil`, then setting this property also sets disabledBorderColor to the same color value with a lightened brightness value and alpha value of `0.75f`.
 *
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

/**
 *  Initializes and returns a button having the given frame, backgroundColor, foregroundColor, title, and image. This method calls `setFlatTitle:` and `setFlatImage:` with the specified title and image, respectively.
 *
 *  @param frame           A rectangle specifying the initial location and size of the button in its superview's coordinates.
 *  @param backgroundColor A color specifying the background color of the button in its default state.
 *  @param foregroundColor A color specifying the foreground color of the button in its default state.
 *  @param title           The title of the button in its default state. This text is colored with the specified foregroundColor.
 *  @param image           The image of the button in its default state. This image is masked with the specified foregroundColor.
 *
 *  @see `setFlatTitle:`
 *  @see `setFlatImage:`
 *
 *  @return An initialized `JSQFlatButton` object or `nil` if the object could not be successfully initialized.
 */
- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              foregroundColor:(UIColor *)foregroundColor
                        title:(NSString *)title
                        image:(UIImage *)image;

#pragma mark - Setters

/**
 *  Sets the title for the button via `setTitle: forState:`, passing the specified title and `UIControlStateNormal`. This method sets the title color to the current color values in normalForegroundColor, highlightedForegroundColor, and disabledForegroundColor for each respective state.
 *
 *  @param title The title to display in the button.
 */
- (void)setFlatTitle:(NSString *)title;

/**
 *  Sets the image for the button via `setImage: forState:`, passing the specified image and `UIControlStateNormal`. This method masks the image to the current color values in normalForegroundColor, highlightedForegroundColor, and disabledForegroundColor for each respective state.
 *
 *  @param image The image to display in the button.
 */
- (void)setFlatImage:(UIImage *)image;

@end