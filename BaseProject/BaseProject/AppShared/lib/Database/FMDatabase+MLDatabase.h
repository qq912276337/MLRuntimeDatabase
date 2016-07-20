//
//  FMDatabase+MLDatabase.h
//  CarLoan
//
//  Created by sml on 16/7/6.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <FMDB/FMDB.h>

typedef void(^ExistExcuteOption)(BOOL exist);
typedef void(^InsertOption)(BOOL insert);
typedef void(^UpdateOption)(BOOL update);
typedef void(^DeleteOption)(BOOL del);
typedef void(^SaveOption)(BOOL save);
typedef void(^ExcuteOption)(id output_model);
typedef void(^AllModelsOption)(NSMutableArray *models);
@interface FMDatabase (CLDatabase)


//- (void)ml_exsitInDatabaseForModel:(id )model primaryKey:(NSString *)primaryKey option:(ExistExcuteOption )option;
//- (void)ml_insertDataWithModel:(id )model option:(InsertOption )option;
//- (void)ml_updateDataWithModel:(id) model optiin:(UpdateOption )option;

- (void )ml_saveDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(SaveOption )option;
- (void)ml_deleteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(DeleteOption )option;
/** 查询某个模型数据 */
- (id )ml_excuteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(ExcuteOption )option;
/** 查询某种所有的模型数据 */
- (void)ml_excuteDatasWithModel:(id )model primaryKey:(NSString *)primaryKey option:(AllModelsOption )option;
@end
