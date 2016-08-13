 //
//  ContentViewController.m
//  BaseProject
//
//  Created by sml on 16/7/4.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "ContentViewController.h"

#import "MainViewController.h"
#import "UIViewController+Additem.h"



@implementation ContentViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addLeftNavigationItemWithImage:@"箭头二" size:CGSizeMake(30, 30) target:self action:@selector(clickContentVcLeftItem)];
    
//    @weakify(self);
//    _timer = [NSTimer hb_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
//        @strongify(self);
//        [self printTest];
//        NSLog(@"hb_scheduledTimer");
//    } repeats:YES];
    
}

- (void)clickContentVcLeftItem{
    [[MainViewController shareMainViewController] showLeftMenu];
}

+ (instancetype)shareContentViewController{
    static ContentViewController *vc;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[self alloc] init];
    });
    return vc;
}
@end
