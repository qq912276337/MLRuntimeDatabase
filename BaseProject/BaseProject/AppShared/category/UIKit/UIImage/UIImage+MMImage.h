//
//  UIImage+MMImage.h
//  缘购网
//
//  Created by imac on 15/9/29.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MMImage)

+(UIImage *)imageWithColor:(UIColor *)color imageSize:(CGSize )size;

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

//返回一张圆的image
//-(UIImage *)getCircleImageWithInset:(CGFloat )inset;
+ (instancetype)circleImageWithImage:(UIImage *)oldImage borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/** 将两张图片合成一张 */
+(UIImage *)composeImageWithSmallImage:(UIImage *)smallImage bigImage:(UIImage *)bigImage;
@end
