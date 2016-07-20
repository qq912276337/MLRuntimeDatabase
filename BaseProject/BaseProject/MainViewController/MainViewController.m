//
//  MainViewController.m
//  BaseProject
//
//  Created by sml on 16/7/4.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "MainViewController.h"

#import "LeftMenuView.h"
#import "ContentViewController.h"
#import "BaseNavigationController.h"
#define LeftMenuInitX 80
#define LeftMenuViewWidthPercent 0.75
@interface MainViewController  ()
@property(nonatomic,strong)LeftMenuView*leftMenuView;
@property(nonatomic,strong)ContentViewController*contentVC;
@property(nonatomic,strong)BaseNavigationController*baseNavc;
@property(nonatomic,strong)UIButton*coverBtnWhenShowLeftMenu;
@end
@implementation MainViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.leftMenuView];
    [self.view addSubview:self.baseNavc.view];
    
}

+ (instancetype)shareMainViewController{
    static MainViewController *mainVC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mainVC = [[self alloc] init];
    });
    return mainVC;
}


/** showLeftMenu */
- (void)showLeftMenu{
    [self leftMenuViewWillShow];
    [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1  options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self leftMenuViewDidShow];
    } completion:^(BOOL finished) {
    }];
}

- (void)leftMenuViewWillShow{
    self.coverBtnWhenShowLeftMenu.alpha = 0;
}

- (void)leftMenuViewDidShow{
    self.leftMenuView.transform = CGAffineTransformMakeTranslation(LeftMenuInitX, 0);
    self.baseNavc.view.transform = CGAffineTransformMakeTranslation(self.leftMenuView.width ,0);
    self.coverBtnWhenShowLeftMenu.frame = MMFrame(self.baseNavc.view.minX, 0, self.view.width - self.leftMenuView.width, self.view.height);
    self.coverBtnWhenShowLeftMenu.alpha = 0.65;
}


/** hideLeftMenu */
- (void)hideLeftMenu{
    [self leftMenuViewWillHide];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1  options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self leftMenuViewDidHide];
    } completion:^(BOOL finished) {
    }];
    
}
- (void)leftMenuViewWillHide{
    
}

- (void)leftMenuViewDidHide{
    self.leftMenuView.transform = CGAffineTransformIdentity;
    self.baseNavc.view.transform = CGAffineTransformIdentity;
    self.coverBtnWhenShowLeftMenu.frame = MMFrame(0, 0, self.view.width, self.view.height);
    self.coverBtnWhenShowLeftMenu.alpha = 0;
}

#pragma mark -- 懒加载
- (LeftMenuView *)leftMenuView{
    if (_leftMenuView == nil) {
        _leftMenuView = [LeftMenuView shareLeftMenuView];
        _leftMenuView.frame = MMFrame(-LeftMenuInitX, 0, MMScreenWide * LeftMenuViewWidthPercent, MMScreenHeight);
        _leftMenuView.backgroundColor = [UIColor grayColor];
    }
    return _leftMenuView;
}

- (BaseNavigationController *)baseNavc{
    if (_baseNavc == nil) {
        _baseNavc = [[BaseNavigationController alloc]initWithRootViewController:self.contentVC];
        [self addChildViewController:_baseNavc];

    }
    return _baseNavc;
}

- (ContentViewController *)contentVC{
    if (_contentVC == nil) {
        _contentVC = [ContentViewController shareContentViewController];
        _contentVC.view.frame = self.view.bounds;
        _contentVC.view.backgroundColor = [UIColor whiteColor];
    }
    return _contentVC;
}

- (UIButton *)coverBtnWhenShowLeftMenu{
    if (_coverBtnWhenShowLeftMenu == nil) {
        _coverBtnWhenShowLeftMenu = [UIButton new];
        _coverBtnWhenShowLeftMenu.frame = self.view.bounds;
        _coverBtnWhenShowLeftMenu.backgroundColor = [UIColor blackColor];
        [_coverBtnWhenShowLeftMenu addTarget:self action:@selector(coverBtnWhenShowLeftMenuOnclick) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:self.coverBtnWhenShowLeftMenu];
    }
    return _coverBtnWhenShowLeftMenu;
}

- (void)coverBtnWhenShowLeftMenuOnclick{
    [self hideLeftMenu];
}

@end
