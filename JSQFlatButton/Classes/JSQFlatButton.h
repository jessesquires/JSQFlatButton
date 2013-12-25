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

@property (strong, nonatomic) UIColor *buttonBackgroundColor;
@property (strong, nonatomic) UIColor *buttonForegroundColor;
@property (assign, nonatomic) BOOL shouldHighlightText;
@property (assign, nonatomic) BOOL shouldHighlightImage;

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame
    backgroundColor:(UIColor *)back
    foregroundColor:(UIColor *)fore;

#pragma mark - Appearance
- (void)setFlatTitle:(NSString *)title;
- (void)setFlatImage:(UIImage *)image;

@end