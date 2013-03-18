//
//  UIImage+JSFlatButton.m
//
//  Created by Jesse Squires on 3/17/13.
//  Copyright (c) 2012 Hexed Bits. All rights reserved.
//
//  http://www.hexedbits.com
//
//  The MIT License
//  Copyright (c) 2013 Jesse Squires
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
//  associated documentation files (the "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
//  following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
//  LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "UIImage+JSFlatButton.m"

@implementation UIImage (JSFlatButton)

- (UIImage *)imageMaskWithColor:(UIColor *)maskColor shadowOffset:(CGPoint)shadow
{
    CGFloat shadowOpacity = 0.54f;
    BOOL hasShadow = !(shadow.x == 0.0f && shadow.y == 0.0f);
    
    CGRect imageRect = CGRectMake(0.0f, 0.0f, self.size.width, self.size.height);
    CGRect shadowRect = CGRectMake(shadow.x, shadow.y, self.size.width, self.size.height);

    CGRect newRect = hasShadow ? CGRectUnion(imageRect, shadowRect) : imageRect;
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, self.scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextScaleCTM(ctx, 1.0f, -1.0f);
    CGContextTranslateCTM(ctx, 0.0f, -(newRect.size.height));
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