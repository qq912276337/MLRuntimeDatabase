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
    
    for (NSInteger i =2; i < 5; i++) {
        /** 模型对象1 */
        BSTeacher *tea = [BSTeacher new];
        tea.id = i;
        tea.depart = @"教职工";
        tea.name = [NSString stringWithFormat:@"%@%ld",NSStringFromClass([tea class]),i];
        
        /** 模型对象2 */
        BSStudent *stu = [BSStudent new];
        stu.id = i;
        stu.name = [NSString stringWithFormat:@"%@%ld",NSStringFromClass([stu class]),i];
        stu.tea = tea;
        
        /** 模型对象0 */
        BSUser *user = [BSUser new];
        user.id = i;
        user.name = [NSString stringWithFormat:@"%@%ld",NSStringFromClass([user class]),i];
        user.stu = stu;
        user.data = [@"12323435" dataUsingEncoding:NSUTF8StringEncoding];
        user.arr = @[tea,tea,tea];
        
        [[MLDatabaseQueue dbQueue] inDatabase:^(FMDatabase *db) {
            /** 存储:会自动调用insert或者update，不需要担心重复插入数据 */
            [db ml_saveDataWithModel:user primaryKey:@"id" option:^(BOOL save) {
            }];
            //
            
            //        /** 查询某个 */
            //        BSUser *user0 = [BSUser new];
            //        user0.id = user.id;
            //        [db ml_excuteDataWithModel:user0 primaryKey:@"id" option:^(BSUser *output_model) {
            //            MMLog(@"-----%@--",output_model.data);
            //        }];
            
            /** 查询某种的所有数据 */
            BSUser *user0 = [BSUser new];
            [db ml_excuteDatasWithModel:user0  option:^(NSMutableArray *models) {
                
            }];
            
            //        /** 删除 */ 
            //        BSUser *user0 = [BSUser new];
            //        user0.id = user.id;
            //        [db ml_deleteDataWithModel:user0 primaryKey:@"id" option:^(BOOL del) {
            //            MMLog(@"------%ld-",del);
            //        }];
        }];
        
    }
    
    
    
    
    
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
