//
//  CLDatabaseQueue.h
//  CarLoan
//
//  Created by sml on 16/6/27.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FMDatabase+MLDatabase.h"
#import <FMDB.h>
#import "NSObject+Runtime.h"
@interface MLDatabaseQueue : NSObject


+ (FMDatabaseQueue *)dbQueue MLDeprecated("ml_databaseQueue");

+ (FMDatabaseQueue *)ml_databaseQueue;

//+ (void)db:(FMDatabase *)db saveDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(SaveOption )option;
//
//
//+ (void)db:(FMDatabase *)db deleteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(DeleteOption )option;
//
///** 查询单个数据 */
//+ (id )db:(FMDatabase *)db excuteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(ExcuteOption )option;
//
///** 查询某个表中所有数据：传入一个类的实例 */
//+ (void)db:(FMDatabase *)db excuteDatasWithModel:(id )model primaryKey:(NSString *)primaryKey option:(AllModelsOption )option;
@end
