//
//  UITabBar+ColorExtensions.m
//  CustomTab
//
//  I actually found this sample code online, but can't remember where, so thanks to who-ever
//	saved me from writing this myself.
//
//  Created by Jeff Hodnett on 13/11/2010.
//  Copyright 2010 Applausible. All rights reserved.
//

#import "UITabBar+ColorExtensions.h"

@implementation UITabBar (ColorExtensions)

- (void)recolorItemsWithColor:(UIColor *)color shadowColor:(UIColor *)shadowColor shadowOffset:(CGSize)shadowOffset shadowBlur:(CGFloat)shadowBlur
{
    CGColorRef cgColor = [color CGColor];
    CGColorRef cgShadowColor = [shadowColor CGColor];
    for (UITabBarItem *item in [self items])
        if ([item respondsToSelector:@selector(selectedImage)] &&
            [item respondsToSelector:@selector(setSelectedImage:)] &&
            [item respondsToSelector:@selector(_updateView)])
        {
            CGRect contextRect;
            contextRect.origin.x = 0.0f;
            contextRect.origin.y = 0.0f;
            contextRect.size = [[item selectedImage] size];
            // Retrieve source image and begin image context
            UIImage *itemImage = [item image];
            CGSize itemImageSize = [itemImage size];
            CGPoint itemImagePosition; 
            itemImagePosition.x = ceilf((contextRect.size.width - itemImageSize.width) / 2);
            itemImagePosition.y = ceilf((contextRect.size.height - itemImageSize.height) / 2);
            UIGraphicsBeginImageContext(contextRect.size);
            CGContextRef c = UIGraphicsGetCurrentContext();

            // Setup shadow
            CGContextSetShadowWithColor(c, shadowOffset, shadowBlur, cgShadowColor);
            
			// Setup transparency layer and clip to mask
            CGContextBeginTransparencyLayer(c, NULL);
            CGContextScaleCTM(c, 1.0, -1.0);
            CGContextClipToMask(c, CGRectMake(itemImagePosition.x, -itemImagePosition.y, itemImageSize.width, -itemImageSize.height), [itemImage CGImage]);
            
			// Fill and end the transparency layer
            CGContextSetFillColorWithColor(c, cgColor);
            contextRect.size.height = -contextRect.size.height;
            CGContextFillRect(c, contextRect);
            CGContextEndTransparencyLayer(c);
            
			// Set selected image and end context
            [item setSelectedImage:UIGraphicsGetImageFromCurrentImageContext()];
            UIGraphicsEndImageContext();
            
			// Update the view
            [item _updateView];
        }
}

@end