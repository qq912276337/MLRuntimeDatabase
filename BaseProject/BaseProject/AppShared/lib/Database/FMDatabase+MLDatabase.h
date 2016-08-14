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

#warning 方法中传入的model，至少模型的主键有值

/** 保存一个模型 */
- (void )ml_saveDataWithModel:(id )model  option:(SaveOption )option;
/** 删除一个模型 */
- (void)ml_deleteDataWithModel:(id )model  option:(DeleteOption )option;
/** 查询某个模型数据 */
- (id )ml_excuteDataWithModel:(id )model  option:(ExcuteOption )option;
/** 查询某种所有的模型数据 */
- (void)ml_excuteDatasWithModel:(id )model  option:(AllModelsOption )option;


#pragma mark -- PrimaryKey
/** 保存一个模型 */
- (void )ml_saveDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(SaveOption )option;
/** 删除一个模型 */
- (void)ml_deleteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(DeleteOption )option;
/** 查询某个模型数据 */
- (id )ml_excuteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(ExcuteOption )option;
/** 查询某种所有的模型数据 */
- (void)ml_excuteDatasWithModel:(id )model primaryKey:(NSString *)primaryKey option:(AllModelsOption )option;

#pragma mark -- Method
/** 根据文件名获取文件全路径 */
- (NSString *)fullPathWithFileName:(NSString *)fileName;
@end
