//
//  UIImageView+KBDeleteImageView.h
//  KuBer
//
//  Created by huaxu on 16/1/12.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (KBDeleteImageView)
/** 左上角添加删除标志 */
-(UIButton *)addDeleteStarOnImageViewWithTarget:(id)target sel:(SEL)action btntag:(NSInteger )tag;
@end
