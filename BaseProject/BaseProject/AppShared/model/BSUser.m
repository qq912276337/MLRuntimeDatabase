//
//  BSUser.m
//  BaseProject
//
//  Created by sml on 16/7/14.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "BSUser.h"

@implementation BSUser

//+ (MLDatabaseRuntimeIvar *)ml_objectPrimaryKey{
//    MLDatabaseRuntimeIvar *ivar = [MLDatabaseRuntimeIvar new];
//    ivar.name = @"uid";
//    ivar.type = RuntimeObjectIvarTypeObject;
//    return ivar;
//}


+ (NSString *)ml_primaryKey{
    return @"userid";
}

+ (NSDictionary *)ml_replacedKeyFromPropertyName{
    return @{@"userid":MLDB_PrimaryKey};
}

+ (NSDictionary *)ml_propertyIsInstanceOfImage{
    return @{@"image":[UIImage class]};
}

+ (NSDictionary *)ml_propertyIsInstanceOfArray{
    return @{@"arr":[BSTeacher class]};
}

+(NSDictionary *)ml_propertyIsInstanceOfData{
    return @{@"data":[NSData class]};
}

+ (NSDictionary *)ml_getClassForKeyIsObject{
    return @{@"stu":[BSStudent class]};
}

+(NSDictionary *)ml_replacedKeyFromDictionaryWhenPropertyIsObject{
    return @{@"stu":[NSString stringWithFormat:@"stu%@",MLDB_AppendingIDForModelProperty]};
}


@end
