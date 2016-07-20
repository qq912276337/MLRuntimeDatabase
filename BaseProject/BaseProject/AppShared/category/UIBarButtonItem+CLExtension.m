//
//  UIBarButtonItem+CLExtension.m
//  CarLoan
//
//  Created by iOS Grouper on 16/6/20.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "UIBarButtonItem+CLExtension.h"

@implementation UIBarButtonItem (CLExtension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)img
{
    UIButton *button = [UIButton new];
    [button setImage:img forState:UIControlStateNormal];
    button.size = CGSizeMake(15, 30);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.imageView.contentMode = 1;
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end
