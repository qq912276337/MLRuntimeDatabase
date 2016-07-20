//
//  CLDatabaseQueue.m
//  CarLoan
//
//  Created by sml on 16/6/27.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "MLDatabaseQueue.h"
//#import "CLUser.h"
//#import "CLPerson.h"
//#import "CLCustomer.h"
//#import "CLRole.h"
//#import "CLCheckRecord.h"
//#import "CLDepart.h"
//#import "CLCredit.h"
//#import "CLAccommodateRecord.h"
//#import "CLPrivilege.h"
//#import "CLFinancialState.h"

#import "BSTeacher.h"
#import "BSUser.h"
#import "BSStudent.h"

#define AppHomePath     [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define DBPath [AppHomePath stringByAppendingPathComponent:@"CarLaonDatabaseQueue1_0.sqlite"]

//typedef void(^ExistOptin)(BOOL exist);
@implementation MLDatabaseQueue
static FMDatabaseQueue *_dbQueue;
static NSMutableArray *_sqlsForCreateTable;

+ (NSMutableArray *)sqlsForCreateTable{
    if (_sqlsForCreateTable == nil) {
        _sqlsForCreateTable = [NSMutableArray arrayWithCapacity:3];
        
        NSString *userSql = [BSUser ml_sqlForCreateTableWithPrimaryKey:@"id"];
        NSString *teaSql = [BSTeacher ml_sqlForCreateTableWithPrimaryKey:@"id"];
        NSString *stuSql = [BSStudent ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        NSString *roleSql = [CLRole ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        NSString *cheack_recordSql = [CLCheckRecord ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        NSString *departSql = [CLDepart ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        NSString *creditSql = [CLCredit ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        NSString *accmmodate_recordSql = [CLAccommodateRecord ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        NSString *privilegeSql = [CLPrivilege ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        NSString *financialSql = [CLFinancialState ml_sqlForCreateTableWithPrimaryKey:@"id"];
//        
        [_sqlsForCreateTable addObject:userSql];
        [_sqlsForCreateTable addObject:teaSql];
        [_sqlsForCreateTable addObject:stuSql];
//        [_sqlsForCreateTable addObject:roleSql];
//        [_sqlsForCreateTable addObject:cheack_recordSql];
//        [_sqlsForCreateTable addObject:departSql];
//        [_sqlsForCreateTable addObject:creditSql];
//        [_sqlsForCreateTable addObject:accmmodate_recordSql];
//        [_sqlsForCreateTable addObject:privilegeSql];
//        [_sqlsForCreateTable addObject:financialSql];
    }
    return _sqlsForCreateTable;
}

+ (FMDatabaseQueue *)dbQueue{
    if (_dbQueue == nil) {
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:DBPath];
        [_dbQueue inDatabase:^(FMDatabase *db) {
            for (NSString *sql in [self sqlsForCreateTable]) {
                BOOL ok = [db executeUpdate:sql];
                if (ok == NO) {
                    MMLog(@"----NO:%@---",sql);
                }
            }
        }];
    }
    return _dbQueue;
}
/*

+ (void)db:(FMDatabase *)db exsitInDatabaseForModel:(id )model primaryKey:(NSString *)primaryKey option:(ExistExcuteOption )option{
    if (!primaryKey) primaryKey = @"id";
    FMResultSet *set = [db executeQuery:[NSString stringWithFormat:@"select * from %@ where %@ = %@ ;",NSStringFromClass([model class]),primaryKey,[model valueForKey:primaryKey]]];
    if (option) {
        if ([set next]) {
            option(YES);
        } else {
            option(NO);
        }
        [set close];
    }
}

+ (void)db:(FMDatabase *)db insertDataWithModel:(id )model option:(InsertOption )option{
    NSString *sql = [[model class] ml_sqlForInsertDataWithModel:model];
    if ([db executeUpdate:sql]) {
        MMLog(@"---insertDataWithModel:YES----");
        if (option) option(YES);
    }else{
        MMLog(@"---insertDataWithModel:NO----");
        if (option) option(NO);
    }
}

+ (void)db:(FMDatabase *)db updateDataWithModel:(id) model optiin:(UpdateOption )option{
    NSString *sql = [[model class] ml_sqlForUpdateWithModel:model primaryKey:@"id"];
        BOOL  ok = [db executeUpdate:sql];
        option(ok);
}

+ (void )db:(FMDatabase *)db saveDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(SaveOption )option{
    [self db:db exsitInDatabaseForModel:model primaryKey:primaryKey option:^(BOOL exist) {
        if (exist) {//update
                [self db:db updateDataWithModel:model optiin:^(BOOL update) {
                    if (option) option(update);
                }];
        }else {//插入
                [self db:db insertDataWithModel:model option:^(BOOL insert) {
                    if (option) option(insert);
                }];
        }
    }];
}
+ (void)db:(FMDatabase *)db deleteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(DeleteOption )option{
    // delete from 表名 where 条件子句。如：delete from person  where id=10
    NSString *table = NSStringFromClass([model class]);
    id vlaue = [model valueForKey:primaryKey];
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where %@ = %@",table,primaryKey,vlaue];
        if (option) {
            option([db executeUpdate:sql]);
        }
}
#pragma mark -- excuteDataWithModel
+ (id )db:(FMDatabase *)db excuteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(ExcuteOption )option{
    
    NSString * sql = [[model class ] ml_sqlForExcuteWithPrimaryKey:primaryKey value:[model valueForKey:primaryKey]];
         FMResultSet *set= [db executeQuery:sql];
        while ([set next]) {
                [[model class ] ml_objectIvar_nameAndIvar_typeWithOption:^(DatabaseRuntimeIvar *ivar) {
                    [[model class] ml_replaceKeyWithIvarName:ivar.name ivar_type:ivar.type option:^(DatabaseRuntimeIvar *ivar) {
                        if (ivar.type == RuntimeObjectIvarTypeArray) {
                            NSString *jsonStr = [set stringForColumn:ivar.name];
                            NSArray *jsonArr = [jsonStr mj_JSONObject];
                            NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:jsonArr.count];
                            
                            Class destclass = [[[model class] ml_propertyIsInstanceOfArray] objectForKey:ivar.name];
                            for (NSDictionary *dict in jsonArr) {
                                [arrM addObject:[destclass mj_objectWithKeyValues:dict]];
                            }
                            [model setValue:arrM forKey:ivar.name];
                        }else if(ivar.type == RuntimeObjectIvarTypeData){
//                            NSData *data = [set dataForColumn:ivar.name];
//                            [model setValue:data forKey:ivar.name];
                            NSString *dataStr = [set stringForColumn:ivar.name];
                            [model setValue:dataStr.mj_JSONData forKey:ivar.name];
                        }else if (ivar.type == RuntimeObjectIvarTypeDoubleAndFloat){
                            [model setValue:@([set doubleForColumn:ivar.name]) forKey:ivar.name];
                        }else if (ivar.type == RuntimeObjectIvarTypeObject){
                             [model setValue:[set stringForColumn:ivar.name] forKey:ivar.name];
                        }else{
                            if ([ivar.name containsString:@"_id"]) {//模型里面嵌套模型
                                id setValue = [set stringForColumn:ivar.name];
                                NSString *realName = [ivar.name substringToIndex:ivar.name.length - 3 ];
                                Class DestClass = [[[model class] ml_getClassForKeyIsObject] objectForKey: realName];
                                id submodel = [[DestClass alloc]init];
                                [submodel setValue:setValue forKey:primaryKey];
                             //   [model setValue:[self db:db  excuteDataWithModel:submodel primaryKey:primaryKey] forKey:realName];
                                [model setValue:[self db:db excuteDataWithModel:submodel primaryKey:primaryKey option:nil] forKey:realName];
                            }else{//基本数据类型：long
                                [model setValue:@([set longForColumn:ivar.name]) forKey:ivar.name];
                            }
                        }
                    }];
                    
                }];
        }
    if (option) option(model);
    return model;
}

#pragma mark -- 查询所有
+ (void)db:(FMDatabase *)db excuteDatasWithModel:(id )model primaryKey:(NSString *)primaryKey option:(AllModelsOption )option{
    NSString *table = NSStringFromClass([model class]);
    NSString *sql = [NSString stringWithFormat:@"select * from %@",table];
    NSMutableArray *arr = [NSMutableArray array];
    FMResultSet *set = [db executeQuery:sql];
    while ([set next]) {
        id submodel = [[[model class] alloc]init];
        id value = [set stringForColumn:primaryKey];
        [submodel setValue:value forKey:primaryKey];
        submodel = [self db:db excuteDataWithModel:submodel primaryKey:@"id" option:nil];
        [arr addObject:submodel];
    }
    if (option) option(arr);
    
}
 */

@end
