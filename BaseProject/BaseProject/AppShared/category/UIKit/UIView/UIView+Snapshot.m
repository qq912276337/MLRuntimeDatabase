//
//  UIView+Snapshot.m
//  KuBer
//
//  Created by 吴双 on 15/12/16.
//  Copyright © 2015年 huaxu. All rights reserved.
//

#import "UIView+Snapshot.h"

@implementation UIView (Snapshot)

- (UIImage *)snapshot {
	UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return image;
}

@end
