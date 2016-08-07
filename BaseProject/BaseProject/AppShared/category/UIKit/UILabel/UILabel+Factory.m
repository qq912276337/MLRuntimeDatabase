//
//  UILabel+Factory.m
//  KuBer
//
//  Created by 吴双 on 16/3/2.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "UILabel+Factory.h"

@implementation UILabel (Factory)

+ (instancetype)labelWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
	UILabel *label = [[self alloc] init];
//	label.font = Const_Unify_Font_Size(fontSize);
//	label.textColor = textColor;
//	label.textAlignment = NSTextAlignmentCenter;
	return label;
}

@end
