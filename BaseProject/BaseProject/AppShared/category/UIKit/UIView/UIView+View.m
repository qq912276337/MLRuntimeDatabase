//
//  UIView+View.m
//  缘购网
//
//  Created by imac on 15/8/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "UIView+View.h"
@implementation UIView (View)


- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}


////设置View边框样式
-(void)setViewBorderWithBorderW:(float )wid cornerRadius:(float)cornerRadius
{
    self.layer.masksToBounds=YES;
    self.layer.borderWidth=wid;
    self.layer.cornerRadius=cornerRadius;
}

-(void)setViewWithText:(NSString *)labelText btnImage:(NSString *)imageName action:(SEL)action target:(id)target
{
    CGFloat btnW=25;
    CGFloat btnH=25;
    CGFloat btnX=(40-25)/2.0;
    CGFloat btnY=0;
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
   // btn.imageView.contentMode=UIViewContentModeCenter;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self addSubview:btn];
    
    CGFloat lblY=CGRectGetMaxY(btn.frame);
    CGFloat lblW=35;
    CGFloat lblX=0.5*(40-35);
    UILabel *flLabel=[[UILabel alloc]initWithFrame:CGRectMake(lblX,lblY , lblW, self.frame.size.height-btnH)];
    flLabel.text=labelText;
    flLabel.adjustsFontSizeToFitWidth=YES;
    [self addSubview:flLabel];

}

-(void)setViewBorderW:(CGFloat )w color:(UIColor *)color corner:(CGFloat )cornerRadius
{
    if (w>0) {
        self.layer.borderWidth=w;
    }
    if (color) {
        self.layer.borderColor=color.CGColor;
    }
    if (cornerRadius>0) {
        self.layer.cornerRadius=cornerRadius;
    }
    
    self.layer.masksToBounds=YES;
}

@end
