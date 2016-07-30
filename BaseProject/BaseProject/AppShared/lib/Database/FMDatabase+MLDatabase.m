//
//  FMDatabase-MLDatabase.m
//  CarLoan
//
//  Created by sml on 16/7/6.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "FMDatabase+MLDatabase.h"

@implementation FMDatabase (CLDatabase)


#pragma mark -- 无PrimaryKey
- (void )ml_saveDataWithModel:(id )model  option:(SaveOption )option{
    [self ml_saveDataWithModel:model primaryKey:MLDB_PrimaryKey option:option];
}

- (void)ml_deleteDataWithModel:(id )model  option:(DeleteOption )option{
    [self ml_deleteDataWithModel:model primaryKey:MLDB_PrimaryKey option:option];
}

- (id )ml_excuteDataWithModel:(id )model  option:(ExcuteOption )option{
    return [self ml_excuteDataWithModel:model primaryKey:MLDB_PrimaryKey option:option];
}

- (void)ml_excuteDatasWithModel:(id )model  option:(AllModelsOption )option{
    [self ml_excuteDatasWithModel:model primaryKey:MLDB_PrimaryKey option:option];
}

#pragma mark -- 有PrimaryKey
- (void)ml_exsitInDatabaseForModel:(id )model primaryKey:(NSString *)primaryKey option:(ExistExcuteOption )option{
    if (!primaryKey) primaryKey = MLDB_PrimaryKey;
    FMResultSet *set = [self executeQuery:[NSString stringWithFormat:@"select * from %@ where %@ = %@ ;",NSStringFromClass([model class]),primaryKey,[model valueForKey:primaryKey]]];
    if (option) {
        if ([set next]) {
            option(YES);
        } else {
            option(NO);
        }
        [set close];
    }
}

- (void)ml_insertDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(InsertOption )option {
    __block NSString *sql1 = [NSString stringWithFormat:@"insert into %@ (",NSStringFromClass([model class])];
    __block NSString *sql2 = [NSString stringWithFormat:@")  values  ("];
    //获取模型的属性名和属性类型
    [[model class] ml_objectIvar_nameAndIvar_typeWithOption:^(MLDatabaseRuntimeIvar *ivar) {
        NSString *ivar_name = ivar.name;
        NSInteger ivar_type = ivar.type;
        if (ivar_type == RuntimeObjectIvarTypeObject) {
            //先取值出来
            id value = [model valueForKey:ivar_name];
            
            if ([[model class] ml_replacedKeyFromDictionaryWhenPropertyIsObject]) {
                NSDictionary *dict = [[model class] ml_replacedKeyFromDictionaryWhenPropertyIsObject];
                if ([dict objectForKey:ivar_name]) {
                    // 递归调用
                    if (value) {
                        [self ml_insertDataWithModel:value primaryKey:MLDB_PrimaryKey option:nil];
                    }
                    //拼接外键
                    id subValue = [value valueForKey:primaryKey];
                    value = subValue;
                    ivar_name = [dict objectForKey:ivar_name];
                    ivar_type = RuntimeObjectIvarTypeOther;
                    sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%ld,",[value longValue]]];
                }
            }
            if ([[model class] ml_propertyIsInstanceOfArray] && [[[model class] ml_propertyIsInstanceOfArray] objectForKey:ivar_name]) {
                NSArray *arr = value;
                NSMutableArray *arrm = [NSMutableArray arrayWithCapacity:arr.count];
                for (id model in arr) {
                    [arrm addObject:[model mj_keyValues]];
                }
                ivar_type = RuntimeObjectIvarTypeArray;
                sql2 = [sql2 stringByAppendingString:@"'"];
                sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%@",arrm.mj_JSONString]];
                sql2 = [sql2 stringByAppendingString:@"',"];
            }
            
            if ([[model class] ml_propertyIsInstanceOfData] && [[[model class] ml_propertyIsInstanceOfData] objectForKey:ivar_name]) {
                NSData *data = value;
                ivar_type = RuntimeObjectIvarTypeData;
                sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%@,",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]]];
            }
            
            if (ivar_type == RuntimeObjectIvarTypeObject) {
                sql2 = [sql2 stringByAppendingString:@"'"];
                sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%@",value]];
                sql2 = [sql2 stringByAppendingString:@"',"];
            }
        }
        else if (ivar_type == RuntimeObjectIvarTypeDoubleAndFloat){
            NSNumber *doubleNumber = [model valueForKey:ivar_name];
            sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%@,",doubleNumber]];
        }else if (ivar_type == RuntimeObjectIvarTypeArray){
            NSArray *arr = [model valueForKey:ivar_name];
            NSMutableArray *arrm = [NSMutableArray arrayWithCapacity:arr.count];
            for (id model in arr) {
                [arrm addObject:[model mj_keyValues]];
            }
            ivar_type = RuntimeObjectIvarTypeArray;
            sql2 = [sql2 stringByAppendingString:@"'"];
            sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%@",arrm.mj_JSONString]];
            sql2 = [sql2 stringByAppendingString:@"',"];
        }else if (ivar_type == RuntimeObjectIvarTypeData){
            NSData *data = [model valueForKey:ivar_name];
            NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%@,",dataStr]];
            
        }else{
            id value = [model valueForKey:ivar_name];
            sql2 = [sql2 stringByAppendingString:[NSString stringWithFormat:@"%ld,",[value longValue]]];
        }
        /** 所有情况sql1的拼接都一样 */
        sql1 = [sql1 stringByAppendingString:[NSString stringWithFormat:@"%@,",ivar_name]];
    }];
    sql1 = [sql1 substringToIndex:sql1.length - 1];
    sql2 = [sql2 substringToIndex:sql2.length - 1];
    sql2 = [sql2 stringByAppendingString:@");"];
    sql1 = [sql1 stringByAppendingString:sql2];
    
    if ([self executeUpdate:sql1]) {
        MMLog(@"---insertDataWithModel:YES----");
        if (option) option(YES);
    }else{
        MMLog(@"---insertDataWithModel:NO----");
        if (option) option(NO);
    }
}

- (void)ml_updateDataWithModel:(id) model primaryKey:(NSString *)primaryKey optiin:(UpdateOption )option{
    NSString *table = NSStringFromClass([model class]);
    NSString *model_primaryKey = [primaryKey copy];
    __block NSString *initSql = [NSString stringWithFormat:@"update %@ set ",table];;
    NSString *sql2 = [NSString stringWithFormat:@" where %@ = %@ ;",primaryKey,[model valueForKey:primaryKey]];
    [[model class] ml_objectIvar_nameAndIvar_typeWithOption:^(MLDatabaseRuntimeIvar *ivar) {
        [[model class] ml_replaceKeyWithIvarName:ivar.name ivar_type:ivar.type option:^(MLDatabaseRuntimeIvar *ivar) {
            
            NSString *ivar_name = ivar.name;
            NSInteger ivar_type = ivar.type;
            id value = nil;
            if (ivar_type == RuntimeObjectIvarTypeObject) {
                value = [model valueForKey:ivar_name];
                if (value) {
                    initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ = ",ivar_name]];
                    initSql = [initSql stringByAppendingString:@"'"];
                    initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@",value]];
                    initSql = [initSql stringByAppendingString:@"',"];
                    value = nil;
                }
            }else if (ivar_type == RuntimeObjectIvarTypeDoubleAndFloat){
                value = [model valueForKey:ivar_name];
            }else if (ivar_type == RuntimeObjectIvarTypeArray){
                
                NSArray *arrValue = [model valueForKey:ivar_name];
                NSMutableArray *arrm = [NSMutableArray arrayWithCapacity:arrValue.count];
                for (id model in arrValue) {
                    [arrm addObject:[model mj_keyValues]];
                }
                value = arrm.mj_JSONString;
                if (value) {
                    initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ = ",ivar_name]];
                    initSql = [initSql stringByAppendingString:@"'"];
                    initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@",value]];
                    initSql = [initSql stringByAppendingString:@"',"];
                    value = nil;
                }
            }else if (ivar_type == RuntimeObjectIvarTypeData){
                NSData *data = [model valueForKey:ivar_name];
                value = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            }else{
                //判断字符串以---MLDB_AppendingIDForModelProperty---结尾
                if ([ivar_name hasSuffix:MLDB_AppendingIDForModelProperty]) {
                    //获取属性的值（是一个模型）
                    NSString *nameForPropertyModel = [ivar_name substringToIndex:ivar_name.length - MLDB_AppendingIDForModelProperty.length];
                    value = [model valueForKey:nameForPropertyModel];
                    if (value) {
                        [self ml_updateDataWithModel:value primaryKey:primaryKey optiin:nil];
                    }
                    value = [value valueForKey:primaryKey];
                }else
                    value = [model valueForKey:ivar_name];
            }
            if (value && ![ivar_name isEqualToString:model_primaryKey]) initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ = %@,",ivar_name,value]];
        }];
    }];
    initSql = [initSql substringToIndex:initSql.length -1];
    initSql = [initSql stringByAppendingString:sql2];
    BOOL  ok = [self executeUpdate:initSql];
    if (option) option(ok);

}

- (void )ml_saveDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(SaveOption )option{
    [self ml_exsitInDatabaseForModel:model primaryKey:primaryKey option:^(BOOL exist) {
        if (exist) {//update
            [self ml_updateDataWithModel:model primaryKey:primaryKey optiin:^(BOOL update) {
                if (option) option(update);
            }];
        }else {//插入
            [self ml_insertDataWithModel:model primaryKey:primaryKey option:^(BOOL insert) {
                if (option) option(insert);
            }];
        }
    }];
}
- (void)ml_deleteDataWithModel:(id )model primaryKey:(NSString *)primaryKey option:(DeleteOption )option{
    NSString *table = NSStringFromClass([model class]);
    id vlaue = [model valueForKey:primaryKey];
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where %@ = %@",table,primaryKey,vlaue];
    if (option) {
        option([self executeUpdate:sql]);
    }
}
#pragma mark -- excuteDataWithModel
- (id )ml_excuteDataWithModel:(id )fmodel primaryKey:(NSString *)primaryKey option:(ExcuteOption )option{
    id fvalue = [fmodel valueForKey:primaryKey];
    id model = [[[fmodel class]alloc ]init];
    [model setValue:fvalue forKey:primaryKey];
    NSString * sql = [[model class ] ml_sqlForExcuteWithPrimaryKey:primaryKey value:[fmodel valueForKey:primaryKey]];
    FMResultSet *set= [self executeQuery:sql];
    while ([set next]) {
        [[model class ] ml_objectIvar_nameAndIvar_typeWithOption:^(MLDatabaseRuntimeIvar *ivar) {
            [[model class] ml_replaceKeyWithIvarName:ivar.name ivar_type:ivar.type option:^(MLDatabaseRuntimeIvar *ivar) {
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
                    NSString *dataStr = [set stringForColumn:ivar.name];
                    [model setValue:[dataStr dataUsingEncoding:NSUTF8StringEncoding] forKey:ivar.name];
                }else if (ivar.type == RuntimeObjectIvarTypeDoubleAndFloat){
                    [model setValue:@([set doubleForColumn:ivar.name]) forKey:ivar.name];
                }else if (ivar.type == RuntimeObjectIvarTypeObject){
                    [model setValue:[set stringForColumn:ivar.name] forKey:ivar.name];
                }else{
                    if ([ivar.name hasSuffix:MLDB_AppendingIDForModelProperty]) {//模型里面嵌套模型
                        id setValue = [set stringForColumn:ivar.name];
                        if ([setValue integerValue] > 0 ) {
                            NSString *realName = [ivar.name substringToIndex:ivar.name.length - 3 ];
                            Class destClass = [[[model class] ml_getClassForKeyIsObject] objectForKey:realName];
                            id subModel = [[destClass alloc]init];
                            //如果主键有替换
                            [subModel setValue:setValue forKey:primaryKey];
                            id retModel = [self ml_excuteDataWithModel:subModel primaryKey:primaryKey option:nil];
                            [model setValue:retModel forKey:realName];
                        }
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
- (void)ml_excuteDatasWithModel:(id )model primaryKey:(NSString *)primaryKey option:(AllModelsOption )option{
    NSString *table = NSStringFromClass([model class]);
    NSString *sql = [NSString stringWithFormat:@"select * from %@",table];
    NSMutableArray *arr = [NSMutableArray array];
    FMResultSet *set = [self executeQuery:sql];
    while ([set next]) {
        id submodel = [[[model class] alloc]init];
        id value = [set stringForColumn:primaryKey];
        [submodel setValue:value forKey:primaryKey];
        submodel = [self ml_excuteDataWithModel:submodel primaryKey:primaryKey option:nil];
        [arr addObject:submodel];
    }
    if (option) option(arr);
    
}
@end
