//
//  TestDatabaseViewController.m
//  CarLoan
//
//  Created by sml on 16/7/30.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "TestDatabaseViewController.h"

#import "BSUser.h"
#import "BSTeacher.h"
#import "BSStudent.h"
#import "MLDatabaseQueue.h"
@interface TestDatabaseViewController ()

@end

@implementation TestDatabaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insert:(id)sender {
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
        user.image = [UIImage imageNamed:@"sml.jpg"];
        user.data = [@"12323435" dataUsingEncoding:NSUTF8StringEncoding];
        user.arr = @[tea,tea,tea];
        
        [[MLDatabaseQueue ml_databaseQueue] inDatabase:^(FMDatabase *db) {
            /** 存储:会自动调用insert或者update，不需要担心重复插入数据 */
            [db ml_saveDataWithModel:user primaryKey:@"id" option:^(BOOL save) {
                MMLog(@"-----save：%ld--",save);
            }];
        }];
        
    }
    
}
- (IBAction)change:(id)sender {
    //修改数据调用方法跟上面insert一样:ml_saveDataWithModel，内部会自动调用数据库的insert或者update
    
}
- (IBAction)del:(id)sender {
    BSUser *user = [BSUser new];
    user.id = 2;
    [[MLDatabaseQueue ml_databaseQueue]inDatabase:^(FMDatabase *db) {
        [db ml_deleteDataWithModel:user option:^(BOOL del) {
            MMLog(@"-----del:%ld--",del);
        }];
    }];
}

- (IBAction)excute:(id)sender {
    
    //查询单个模型数据
    BSUser *user = [BSUser new];
    user.id = 3;
    [[MLDatabaseQueue ml_databaseQueue]inDatabase:^(FMDatabase *db) {
        [db ml_excuteDataWithModel:user option:^(id output_model) {
            MMLog(@"-----%@--",[output_model mj_keyValues]);
        }];
    }];
////    查询某种模型的所有数据、
//    [[MLDatabaseQueue ml_databaseQueue]inDatabase:^(FMDatabase *db) {
//        [db ml_excuteDatasWithModel:[BSUser new] option:^(NSMutableArray *models) {
//            MMLog(@"----%@---",models);
//        }];
//    }];
}

@end
