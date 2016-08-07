//
//  LeftMenuView.m
//  BaseProject
//
//  Created by sml on 16/7/4.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "LeftMenuView.h"

#import "MMBlurEffectView.h"
@interface LeftMenuView  ()
/** 磨砂View */
@property(nonatomic,strong)MMBlurEffectView*blurEffectView;

@end
@implementation LeftMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.blurEffectView = [MMBlurEffectView new];
        self.blurEffectView.image = [UIImage imageNamed:@"sml.jpg"];
        [self addSubview:self.blurEffectView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.blurEffectView.frame = self.bounds;
}


+ (instancetype)shareLeftMenuView{
    static LeftMenuView *leftMenu;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        leftMenu = [[self alloc] init];
    });
    return leftMenu;
}

@end
