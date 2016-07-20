//
//  UINavigationBar+Extension.m
//  Tools
//
//  Created by Magic_Unique on 15/8/21.
//  Copyright (c) 2015年 Unique. All rights reserved.
//

#import "UINavigationBar+Extension.h"
#import "UIImage+Extension.h"
#import "UIColor+Extension.h"
#import <objc/runtime.h>

@implementation UINavigationBar (Extension)

static const char *AlphaBackgroundColorKey = '\0';

- (void)setAlphaBackgroundColor:(UIColor *)color {
    [self setAlphaBackgroundColor:color animated:NO];
}

- (UIColor *)alphaBackgroundColor {
    UIColor *color =  objc_getAssociatedObject(self, AlphaBackgroundColorKey);
    if (color) {
        return color;
    } else {
        return self.backgroundColor;
    }
}

- (void)setAlphaBackgroundColor:(UIColor *)alphaBackgroundColor animated:(BOOL)animated {
    //KVO
    [self willChangeValueForKey:@"alphaBackgroundColor"];
    
//    self.translucent = YES;
//    [self setBackgroundColor:alphaBackgroundColor];
//    return;
    
    //Core code...
    self.translucent = NO;
    UIImage *shadowImage = [UIImage imageWithColor:[UIColor clearColor] andSize:CGSizeMake(2, 2)];
    UIEdgeInsets edge = UIEdgeInsetsMake(0, 10, 0, 10);
    shadowImage = [shadowImage resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
    UIImage *shadowClear = [UIImage imageWithColor:[UIColor clearColor] andSize:CGSizeMake(self.frame.size.width, 1)];
    
    if (animated) {
        dispatch_async(dispatch_queue_create("NavigationAlphaBackgroundColorAnimation", NULL), ^{
            
            NSUInteger stepCount = 20;
            
            for (int i = 0; i <= stepCount; i++) {
                UIColor *current = [UIColor colorWithSourceColor:self.alphaBackgroundColor targetColor:alphaBackgroundColor stepCount:stepCount stepIndex:i];
                UIImage *backgroundImage = [UIImage imageWithColor:current andSize:self.frame.size];
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
                    if (current.alphaValue >= 1) {
                        [self setShadowImage:shadowImage];
                    } else {
                        [self setShadowImage:shadowClear];
                    }
                });
                
                [NSThread sleepForTimeInterval:0.01];
            }
            
            //Runtime
            objc_setAssociatedObject(self, AlphaBackgroundColorKey, alphaBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            //KVO
            [self didChangeValueForKey:@"alphaBackgroundColor"];
        });
        return ;
    } else {
        UIImage *backgroundImage = [UIImage imageWithColor:alphaBackgroundColor andSize:self.frame.size];
        [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        
        if (alphaBackgroundColor.alphaValue >= 1) {
            [self setShadowImage:shadowImage];
        } else {
            UIImage *shadowImage = [UIImage imageWithColor:[UIColor clearColor] andSize:CGSizeMake(self.frame.size.width, 1)];
            [self setShadowImage:shadowImage];
        }
        
        //Runtime
        objc_setAssociatedObject(self, AlphaBackgroundColorKey, alphaBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        //KVO
        [self didChangeValueForKey:@"alphaBackgroundColor"];
    }
    
}

@end
