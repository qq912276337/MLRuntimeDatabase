//
//  UIBarButtonItem+CLExtension.h
//  CarLoan
//
//  Created by iOS Grouper on 16/6/20.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CLExtension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage *)img;

@end
