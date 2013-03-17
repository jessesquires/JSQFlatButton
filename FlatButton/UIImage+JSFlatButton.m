//
//  UIImage+JSFlatButton.m
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2012 Hexed Bits. All rights reserved.
//

#import "UIImage+JSFlatButton.m"

@implementation UIImage (JSFlatButton)

- (UIImage *)imageMaskWithColor:(UIColor *)maskColor shadowOffset:(CGPoint)shadow
{
    float shadowOpacity = 0.54;
    BOOL hasShadow = !(shadow.x == 0 && shadow.y == 0);
    
    CGRect imageRect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGRect shadowRect = CGRectMake(shadow.x, shadow.y, self.size.width, self.size.height);

    CGRect newRect = hasShadow ? CGRectUnion(imageRect, shadowRect) : imageRect;
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -(newRect.size.height));
    CGContextSaveGState(ctx);
    
    if(hasShadow) {
        CGContextClipToMask(ctx, shadowRect, self.CGImage);
        CGContextSetFillColorWithColor(ctx, [UIColor colorWithWhite:0 alpha:shadowOpacity].CGColor);
        CGContextFillRect(ctx, shadowRect);
    }
    
    CGContextRestoreGState(ctx);
    CGContextClipToMask(ctx, imageRect, self.CGImage);
    CGContextSetFillColorWithColor(ctx, maskColor.CGColor);
    CGContextFillRect(ctx, imageRect);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end