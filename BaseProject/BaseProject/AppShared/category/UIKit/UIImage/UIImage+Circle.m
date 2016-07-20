//
//  UIImage+Circle.m
//  KuBer
//
//  Created by 吴双 on 16/2/29.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "UIImage+Circle.h"
#import "MUCircleImageManager.h"

@implementation UIImage (Circle)

- (UIImage *)circleImage {
	return [MUCircleImageManager circleImageWithImage:self];
}

@end