//
//  UIView+Scale.m
//  KuBer
//
//  Created by 吴双 on 16/1/7.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "UIView+Scale.h"

@implementation UIView (Scale)

- (void)scaleToWidthEqual:(CGFloat)newWidth {
	CGRect oldFrame = self.frame;
	CGRect newFrame = self.frame;
	newFrame.size.width = newWidth;
	newFrame.size.height = newFrame.size.width / oldFrame.size.width * oldFrame.size.height;
	self.frame = newFrame;
}

- (void)scaleToHeightEqual:(CGFloat)newHeight {
	CGRect oldFrame = self.frame;
	CGRect newFrame = self.frame;
	newFrame.size.height = newHeight;
	newFrame.size.width = newFrame.size.height / oldFrame.size.height * oldFrame.size.width;
	self.frame = newFrame;
}

@end
