//
//  NSString+Size.m
//  KuBer
//
//  Created by 吴双 on 16/3/8.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
	return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (CGSize)sizeWithFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize {
	return [self sizeWithFont:[UIFont systemFontOfSize:fontSize] maxSize:maxSize];
}

- (CGFloat)heightWithFontSize:(CGFloat)fontSize maxWidth:(CGFloat)maxWidth {
	return [self sizeWithFontSize:fontSize maxSize:CGSizeMake(maxWidth, MAXFLOAT)].height;
}

@end
