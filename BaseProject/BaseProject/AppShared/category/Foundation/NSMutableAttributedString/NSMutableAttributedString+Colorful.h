//
//  NSMutableAttributedString+Colorful.h
//  KuBer
//
//  Created by 吴双 on 16/3/14.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (Colorful)

+ (instancetype)attributedStringWithString:(NSString *)string
								tintColor:(UIColor *)tintColor
								 location:(NSInteger )location;

+ (instancetype)attributedStringWithString:(NSString *)string
								tintColor:(UIColor *)tintColor
								 location:(NSInteger )location
								   length:(NSInteger )length;

+ (instancetype)attributedStringWithString:(NSString *)string
								tintColor:(UIColor *)tintColor
							  normalColor:(UIColor *)normalColor
								 location:(NSInteger)location
								   length:(NSInteger)length;

- (void)setForegroundColor:(UIColor *)foregroundColor withLocation:(NSUInteger)location;
- (void)setForegroundColor:(UIColor *)foregroundColor withLocation:(NSUInteger)location length:(NSUInteger)length;

@end
