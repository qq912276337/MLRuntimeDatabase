//
//  UIViewController+Additem.h
//  快帮KuBer
//
//  Created by imac on 15/10/19.
//  Copyright (c) 2015年 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AddItem)
/** leftItem:文字 */
-(void)addLeftNavigationItemWithText:(NSString *)text textColor:(UIColor *)textColor size:(CGSize)size target:(id)target action:(SEL)action;
/** leftItem：图片 */
-(void)addLeftNavigationItemWithImage:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action;
/** rightItem:文字 */
- (void)addRightNavigationItemWithText:(NSString *)text textColor:(UIColor *)textColor size:(CGSize)size target:(id)target action:(SEL)action;
/** rightItem:图片 */
-(void)addRightNavigationItemWithImage:(NSString *)imageName size:(CGSize)size target:(id)target action:(SEL)action;

@end
