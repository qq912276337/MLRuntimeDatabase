//
//  UIView+View.h
//
//  Created by imac on 15/8/28.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (View)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
//@property (nonatomic, assign) CGFloat centerX;
//@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;



-(void)setViewBorderWithBorderW:(float )wid cornerRadius:(float)cornerRadius;
-(void)setViewWithText:(NSString *)labelText btnImage:(NSString *)imageName action:(SEL)action target:(id)target;
-(void)setViewBorderW:(CGFloat )w color:(UIColor *)color corner:(CGFloat )cornerRadius;
@end
