//
//  UIView+KBView.m
//  KuBer
//
//  Created by Shuang on 15/11/25.
//  Copyright © 2015年 huaxu. All rights reserved.
//

#import "UIView+KBView.h"

@implementation UIView (KBView)

- (void)setBorderWithDefaultValue {
    [self setBorderWidth:1 color:[UIColor colorWithWhite:0.5 alpha:0.5] cornerRadius:3];
}

- (void)setBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}
@end
