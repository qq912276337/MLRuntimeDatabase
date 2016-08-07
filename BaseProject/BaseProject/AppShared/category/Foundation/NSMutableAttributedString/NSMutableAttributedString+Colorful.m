//
//  NSMutableAttributedString+Colorful.m
//  KuBer
//
//  Created by 吴双 on 16/3/14.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "NSMutableAttributedString+Colorful.h"

@implementation NSMutableAttributedString (Colorful)

+ (instancetype)attributedStringWithString:(NSString *)string
								tintColor:(UIColor *)tintColor
								location:(NSInteger)location {
	return [self attributedStringWithString:string tintColor:tintColor location:location length:string.length - location];
}

+ (instancetype)attributedStringWithString:(NSString *)string
								tintColor:(UIColor *)tintColor
								 location:(NSInteger)location
								   length:(NSInteger)length {
	return [self attributedStringWithString:string tintColor:tintColor normalColor:[UIColor darkGrayColor] location:location length:length];
}

+ (instancetype)attributedStringWithString:(NSString *)string
								tintColor:(UIColor *)tintColor
							  normalColor:(UIColor *)normalColor
								 location:(NSInteger)location
								   length:(NSInteger)length {
	NSMutableAttributedString *str = [[self alloc] initWithString:string];
	[str addAttribute:NSForegroundColorAttributeName value:normalColor range:NSMakeRange(0,location)];
	[str addAttribute:NSForegroundColorAttributeName value:tintColor range:NSMakeRange(location, length)];
	[str addAttribute:NSForegroundColorAttributeName value:normalColor range:NSMakeRange(location + length, string.length - location - length)];
	
	return str;
}

- (void)setForegroundColor:(UIColor *)foregroundColor withLocation:(NSUInteger)location {
	[self setForegroundColor:foregroundColor withLocation:location length:self.length - location];
}

- (void)setForegroundColor:(UIColor *)foregroundColor withLocation:(NSUInteger)location length:(NSUInteger)length {
	[self addAttribute:NSForegroundColorAttributeName value:foregroundColor range:NSMakeRange(location, length)];
}

@end
