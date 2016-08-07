//
//  UIView+KBView.h
//  KuBer
//
//  Created by Shuang on 15/11/25.
//  Copyright © 2015年 huaxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KBView)

- (void)setBorderWithDefaultValue;

- (void)setBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;

@end
