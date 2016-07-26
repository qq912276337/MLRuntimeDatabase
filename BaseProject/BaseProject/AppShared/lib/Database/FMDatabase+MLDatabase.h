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

#warning 使用MLDatabase，必须保证每个模型类的主键保持一致，例如我给的例子中User，Teacher，Student的主键都是@“id”，然后修改MLDB_PrimaryKey ＝ 模型类主键
#warning 如果项目中的模型类的主键不唯一，可以使用MJExtension替换主键（将模型主键改成一致）

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
@end
