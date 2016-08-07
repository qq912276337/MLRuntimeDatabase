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

@end
