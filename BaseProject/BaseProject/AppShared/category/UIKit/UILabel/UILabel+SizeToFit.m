//
//  UILabel+SizeToFit.m
//  KuBer
//
//  Created by 吴双 on 15/12/9.
//  Copyright © 2015年 huaxu. All rights reserved.
//

#import "UILabel+SizeToFit.h"

@implementation UILabel (SizeToFit)

- (void)sizeToFitWithLimitSize:(CGSize)limitSize {
    CGRect frame = [self.text boundingRectWithSize:limitSize options:1 attributes:@{NSFontAttributeName:self.font} context:nil];
    frame.origin = self.frame.origin;
    self.frame = frame;
}

@end
