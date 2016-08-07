//
//  BSStudent.m
//  BaseProject
//
//  Created by sml on 16/7/14.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "BSStudent.h"

@implementation BSStudent
+(NSDictionary *)ml_replacedKeyFromDictionaryWhenPropertyIsObject{
    return @{@"tea":[NSString stringWithFormat:@"tea%@",MLDB_AppendingIDForModelProperty]};
}

+ (NSDictionary *)ml_getClassForKeyIsObject{
    return @{@"tea":[BSTeacher class]};
}
@end
