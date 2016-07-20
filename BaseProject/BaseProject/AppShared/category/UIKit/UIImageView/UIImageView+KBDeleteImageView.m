//
//  UIImageView+KBDeleteImageView.m
//  KuBer
//
//  Created by huaxu on 16/1/12.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "UIImageView+KBDeleteImageView.h"

@implementation UIImageView (KBDeleteImageView)

-(UIButton *)addDeleteStarOnImageViewWithTarget:(id)target sel:(SEL)action btntag:(NSInteger )tag{
    UIButton *btn = [[UIButton alloc]initWithFrame:MMFrame(4, 4, 18, 18)];
    btn.backgroundColor = [UIColor redColor];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setBackgroundImage:[UIImage imageNamed:@"KBPublishPicRedece"] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = btn.width/2;
    btn.tag = tag;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.center = CGPointMake(3, 3);
    self.clipsToBounds = NO;
    [self addSubview:btn];
    return btn;
}

@end
