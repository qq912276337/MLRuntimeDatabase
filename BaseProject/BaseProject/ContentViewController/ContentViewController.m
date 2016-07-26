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

#import "BSUser.h"
#import "BSTeacher.h"
#import "BSStudent.h"
#import "MLDatabaseQueue.h"

@implementation ContentViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addLeftNavigationItemWithImage:@"箭头二" size:CGSizeMake(30, 30) target:self action:@selector(clickContentVcLeftItem)];
    NSInteger i = 1;
//    for (NSInteger i =0; i < 5; i++) {
        BSTeacher *tea = [BSTeacher new];
        tea.id = i;
        tea.name = [NSString stringWithFormat:@"%@%ld",NSStringFromClass([tea class]),i];
        
        BSStudent *stu = [BSStudent new];
        stu.id = i;
        stu.name = [NSString stringWithFormat:@"%@%ld",NSStringFromClass([stu class]),i];
        stu.tea = tea;
        
        BSUser *user = [BSUser new];
        user.id = i;
        user.name = [NSString stringWithFormat:@"%@%ld",NSStringFromClass([user class]),i];
        user.stu = stu;
        user.data = [@"12323435" dataUsingEncoding:NSUTF8StringEncoding];
        MMLog(@"------%@-",user.data);
        user.arr = @[tea,tea,tea];
    
    [[MLDatabaseQueue dbQueue] inDatabase:^(FMDatabase *db) {
            [db ml_saveDataWithModel:user primaryKey:@"id" option:^(BOOL save) {
                
            }];
        BSUser *user0 = [BSUser new];
        user0.id = user.id;
        [db ml_excuteDataWithModel:user0 primaryKey:@"id" option:^(BSUser *output_model) {
            MMLog(@"-----%@--",output_model.data);
        }];
    }];
    
    
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
