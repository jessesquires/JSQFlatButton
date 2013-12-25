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

@interface JSQFlatButton : UIButton

@property (strong, nonatomic) UIColor *normalBackgroundColor;
@property (strong, nonatomic) UIColor *highlightedBackgroundColor;
@property (strong, nonatomic) UIColor *disabledBackgroundColor;

@property (strong, nonatomic) UIColor *normalForegroundColor;
@property (strong, nonatomic) UIColor *highlightedForegroundColor;
@property (strong, nonatomic) UIColor *disabledForegroundColor;

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
              foregroundColor:(UIColor *)foregroundColor;

#pragma mark - Setters

- (void)setFlatTitle:(NSString *)title;

- (void)setFlatImage:(UIImage *)image;

@end