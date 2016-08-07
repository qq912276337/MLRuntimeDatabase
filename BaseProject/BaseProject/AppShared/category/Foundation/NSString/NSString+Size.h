//
//  NSString+Size.h
//  KuBer
//
//  Created by 吴双 on 16/3/8.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGSize)sizeWithFontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

- (CGFloat)heightWithFontSize:(CGFloat)fontSize maxWidth:(CGFloat)maxWidth;

@end
