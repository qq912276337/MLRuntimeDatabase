//
//  MMBlurEffectView.m
//  BaseProject
//
//  Created by sml on 16/7/5.
//  Copyright © 2016年 sml. All rights reserved.
//  磨砂效果view

#import "MMBlurEffectView.h"

@interface MMBlurEffectView  ()
@property(nonatomic,strong)UIView*blurEffectView;
@end
@implementation MMBlurEffectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        //    // 判断系统版本是否支持 8.0
        //
        //    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        //        // 磨砂效果
        //        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        //        // 磨砂视图
        //        _blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        //    } else {
        //        // 屏幕截图 - 调用苹果官方框架实现磨砂效果
        //        UIImage *screenShot = [UIImage screenShot].applyLightEffect;
        //        _blurEffectView = [[UIImageView alloc] initWithImage:screenShot];
        //    }
        //
        //    //    [self addSubview:blurEffectView];
        //    
        //    [self insertSubview:_blurEffectView atIndex:0];
        
        //磨砂效果
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            // 磨砂效果
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            // 磨砂视图
            self.blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            [self addSubview:self.blurEffectView];
        }
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.blurEffectView.frame = self.bounds;
}

@end
