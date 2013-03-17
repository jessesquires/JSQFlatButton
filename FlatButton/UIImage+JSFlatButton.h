//
//  UIImage+JSFlatButton.h
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2012 Hexed Bits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (JSFlatButton)

- (UIImage *)imageMaskWithColor:(UIColor *)maskColor shadowOffset:(CGPoint)shadow;

@end