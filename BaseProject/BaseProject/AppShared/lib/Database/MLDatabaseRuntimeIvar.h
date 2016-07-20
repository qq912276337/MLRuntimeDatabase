//
//  MMRuntimeIvarModel.h
//  CarLoan
//
//  Created by sml on 16/6/25.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLDatabaseRuntimeIvar : NSObject

/** 模型属性的名称 */
@property (nonatomic, copy) NSString *name;

/** 模型属性的类型值 */
@property(nonatomic,assign)NSInteger type;

@end
