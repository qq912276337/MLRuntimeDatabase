//
//  NSObject+Runtime.m
//  CarLoan
//
//  Created by sml on 16/6/25.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)

NSString *const MLDB_AppendingIDForModelProperty = @"_id";

NSString *const MLDB_PrimaryKey = @"id";


+ (NSDictionary *)ml_primaryKey{
    return nil;
}

/**
 *  属性名为数组
 *
 */

+ (NSDictionary *)ml_propertyIsInstanceOfArray{
    return nil;
}

/**
 *  属性名为NSDATA
 *
 */
+ (NSDictionary *)ml_propertyIsInstanceOfData{
    return nil;
}
/**
 *  只有这个数组中的属性名才允许
 */
+ (NSArray *)ml_allowedPropertyNames{
    return nil;
}

/**
 *  这个数组中的属性名将会被忽略：不进行
 */
+ (NSArray *)ml_ignoredPropertyNames{
    return nil;
}

/**
 *  将属性名换为其他key
 *
 */
+ (NSDictionary *)ml_replacedKeyFromPropertyName{
    return nil;
}

/**
 *  将属性是一个模型对象:字典再根据属性名获取value作为字段名
    示例：@{@"tea":[NSString stringWithFormat:@"tea%@",MLDB_AppendingIDForModelProperty]}；
 *
 */
+ (NSDictionary*)ml_replacedKeyFromDictionaryWhenPropertyIsObject{
    return nil;
}

+ (NSDictionary *)ml_getClassForKeyIsObject{
    return nil;
}


+ (void)ml_objectIvar_nameAndIvar_typeWithOption:(RuntimeObjectIvarsOption )option{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i =0; i < count; i++) {
        Ivar ivar = ivars[i];
        /** 成员变量名 */
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        const char *type = ivar_getTypeEncoding(ivar);
        NSInteger ivar_type = (NSInteger ) type[0];
        NSString *ivar_name = [key substringFromIndex:1];
        MLDatabaseRuntimeIvar *model = [MLDatabaseRuntimeIvar new];
        model.name = ivar_name;
        model.type = ivar_type;
        if (option) {
            option(model);
        }
    }
    free(ivars);
}

#pragma mark -- SQL
+ (NSString *)ml_sqlForCreateTableWithPrimaryKey:(NSString *)primaryKey{
    return [self ml_sqlForCreateTableWithPrimaryKey:primaryKey extraKeyValues:nil];
}

+ (NSString *)ml_sqlForCreateTableWithPrimaryKey:(NSString *)primaryKey extraKeyValues:(NSArray <MLDatabaseRuntimeIvar *> *)extraKeyValues{
    __block NSString *initSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (",NSStringFromClass([self class])];
    [self ml_objectIvar_nameAndIvar_typeWithOption:^(MLDatabaseRuntimeIvar *ivar) {
        [self ml_replaceKeyWithIvarName:ivar.name ivar_type:ivar.type option:^(MLDatabaseRuntimeIvar *ivar) {
            initSql = [initSql stringByAppendingString:[self ml_sqlWithExtraKeyValue:@[ivar] primaryKey:primaryKey]];
        }];
        
    }];
    if (extraKeyValues) {
        initSql = [initSql stringByAppendingString:[self ml_sqlWithExtraKeyValue:extraKeyValues primaryKey:primaryKey]];
    }
    initSql = [initSql substringToIndex:initSql.length-1];
    initSql = [initSql stringByAppendingString:@");"];
    return initSql;

}

+ (NSString *)ml_sqlWithExtraKeyValue:(NSArray *)extraKeyValues primaryKey:(NSString *)primaryKey{
    NSString *initSql = @"";
    for (MLDatabaseRuntimeIvar *model in extraKeyValues) {
        NSString *ivar_name = model.name;
        NSInteger ivar_type = model.type;
        if (ivar_type == RuntimeObjectIvarTypeDoubleAndFloat) {
            initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ double DEFAULT NULL,",ivar_name]];
        }else if(ivar_type == RuntimeObjectIvarTypeObject){
            initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ text DEFAULT NULL,",ivar_name]];
        }else if (ivar_type == RuntimeObjectIvarTypeArray){
            initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ text DEFAULT NULL,",ivar_name]];
        }else if (ivar_type == RuntimeObjectIvarTypeData){
            initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ text DEFAULT NULL,",ivar_name]];
        }else{
            /** id */
            if ([ivar_name isEqualToString:primaryKey] ) {
                initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ integer(11) PRIMARY KEY ,",ivar_name]];
            }else
                initSql = [initSql stringByAppendingString:[NSString stringWithFormat:@"%@ long DEFAULT NULL,",ivar_name]];
        }
    }
    return initSql;
}


+ (NSString *)ml_sqlForExcuteWithPrimaryKey:(NSString *)primaryKey value:(id )value{
    return  [NSString stringWithFormat:@"select * from %@ where %@ = %@",NSStringFromClass(self),primaryKey,value];
}


#pragma mark -- replaceKeyValue
/** 通过属性名获取正确的字段名 */
+ (void)ml_replaceKeyWithIvarName:(NSString *)ivar_name ivar_type:(NSInteger )ivar_type option:(RuntimeObjectIvarsOption )option {
    NSString *newIvarName = [[self ml_replacedKeyFromPropertyName] objectForKey:ivar_name];
    ivar_name = (newIvarName ) ? newIvarName : ivar_name;
    
    /** 如果属性名是对象模型名字，取值替换 */
    if ([self ml_replacedKeyFromDictionaryWhenPropertyIsObject] && [[self ml_replacedKeyFromDictionaryWhenPropertyIsObject] objectForKey:ivar_name]) {
        ivar_name =  [[self ml_replacedKeyFromDictionaryWhenPropertyIsObject] objectForKey:ivar_name];
        // 将类型重置为 非对象类型
        ivar_type = RuntimeObjectIvarTypeOther;
    }
    
    if ([self ml_propertyIsInstanceOfArray]) {
        if ([[self ml_propertyIsInstanceOfArray] objectForKey:ivar_name]) {
            ivar_type = RuntimeObjectIvarTypeArray;
        }
    }
    
    if ([self ml_propertyIsInstanceOfData] && [[self ml_propertyIsInstanceOfData] objectForKey:ivar_name]) {
        ivar_type = RuntimeObjectIvarTypeData;
    }
    
    
    MLDatabaseRuntimeIvar *ivar = [MLDatabaseRuntimeIvar new];
    ivar.name = ivar_name;
    ivar.type = ivar_type;
    if (option) {
        option(ivar);
    }
}



@end
