//
//  UITableView+SeparatorColor.m
//  KuBer
//
//  Created by 吴双 on 16/2/29.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "UITableView+SeparatorColor.h"

#import <objc/runtime.h>

@implementation UITableView (SeparatorColor)

//+ (void)load {
//	method_exchangeImplementations(class_getInstanceMethod([self class], @selector(initWithFrame:style:)), class_getInstanceMethod([self class], @selector(initWithFrame:andStyle:)));
//}
//
//- (instancetype)initWithFrame:(CGRect)frame andStyle:(UITableViewStyle)style {
//	self = [self initWithFrame:frame andStyle:style];
//	if (self) {
//		self.backgroundColor = Const_Unify_Color_TableView;
//		self.separatorColor = Const_Unify_Color_TableView;
//	}
//	return self;
//}

- (void)setSeparatorAndBackgroundColor:(UIColor *)color {
	self.backgroundColor = color;
	self.separatorColor = color;
}

@end
