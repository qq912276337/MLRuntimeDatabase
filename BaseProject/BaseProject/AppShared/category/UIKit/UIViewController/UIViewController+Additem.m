//
//  UIViewController+Additem.m
//  快帮KuBer
//
//  Created by imac on 15/10/19.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import "UIViewController+Additem.h"
@implementation UIViewController (AddItem)


//-(void)addLeftNavigationItem:(NSString *)text image:(NSString *)imageName target:(id)target action:(SEL)action
//{
//    UIButton *btn=[UIButton new];
//    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    btn.frame=CGRectMake(0, 0, 30,30);
//    if (text) {
//        [btn setTitle:text forState:UIControlStateNormal];
//    }
//    if (imageName) {
//        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    }
//    UIBarButtonItem *leftBarButtonItem =  [[UIBarButtonItem alloc]initWithCustomView:btn];
//    UIBarButtonItem *itemSpace0=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    itemSpace0.width=-10;
//    self.navigationItem.leftBarButtonItems=@[itemSpace0,leftBarButtonItem];
//    
//}
//
//
//-(void)addRightNavigationItem:(NSString *)text image:(NSString *)imageName target:(id)target action:(SEL)action
//{
//    UIButton *btn=[UIButton new];
//    btn.frame=CGRectMake(0, 0, 30,30);
//    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    if (text) {
//        [btn setTitle:text forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    }
//    if (imageName) {
//        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    }
//    UIBarButtonItem *rightBarButtonItem =  [[UIBarButtonItem alloc]initWithCustomView:btn];
//    UIBarButtonItem *itemSpace1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    itemSpace1.width=-9.5;
//    self.navigationItem.rightBarButtonItems=@[itemSpace1,rightBarButtonItem];
//    
//}

#pragma mark -- publichLeft
-(void)addLeftNavigationItemWithText:(NSString *)text textColor:(UIColor *)textColor size:(CGSize)size target:(id)target action:(SEL)action{
    [self addLeftNavigationItemWithText:text textColor:textColor image:nil size:size target:target action:action];
    
}

-(void)addLeftNavigationItemWithImage:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action{
    [self addLeftNavigationItemWithText:nil textColor:nil image:imageName size:size target:target action:action];
}

#pragma mark -- privateLeft
-(void)addLeftNavigationItemWithText:(NSString *)text textColor:(UIColor *)textColor image:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton new];
    btn.size=size;
    btn.adjustsImageWhenHighlighted = NO;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    }
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    UIBarButtonItem *leftBarButtonItem =  [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *itemSpace0=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    itemSpace0.width=-10;
    self.navigationItem.leftBarButtonItems=@[itemSpace0,leftBarButtonItem];
    
}

#pragma mark -- publicRight
- (void)addRightNavigationItemWithText:(NSString *)text textColor:(UIColor *)textColor size:(CGSize)size target:(id)target action:(SEL)action{
    [self addRightNavigationItem:text textColor:textColor image:nil size:size target:target action:action];
}

-(void)addRightNavigationItemWithImage:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action{
    [self addRightNavigationItem:nil textColor:nil image:imageName size:size target:target action:action];

}


#pragma mark -- privateRight
-(void)addRightNavigationItem:(NSString *)text textColor:(UIColor *)textColor image:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton new];
    btn.size=size;
    btn.adjustsImageWhenHighlighted = NO;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (text) {
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:textColor forState:UIControlStateNormal];
    }
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    UIBarButtonItem *rightBarButtonItem =  [[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *itemSpace1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    itemSpace1.width=-9.5;
    self.navigationItem.rightBarButtonItems=@[itemSpace1,rightBarButtonItem];
    
}


@end
