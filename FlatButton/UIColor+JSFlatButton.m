//
//  UIColor+JSFlatButton.m
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "UIColor+JSFlatButton.h"

@implementation UIColor (JSFlatButton)

- (UIColor *)darkenedColor
{
    CGFloat h,s,b,a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 0.85 alpha:a];
}

- (UIColor *)lightenedColor
{
    CGFloat h,s,b,a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return [UIColor colorWithHue:h saturation:s brightness:b * 1.15 alpha:a];
}

@end