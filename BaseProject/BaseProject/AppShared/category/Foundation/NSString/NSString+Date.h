//
//  NSString+Date.h
//  KuBer
//
//  Created by 吴双 on 15/12/29.
//  Copyright © 2015年 huaxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

@property (nonatomic, strong, readonly) NSDate *date;

@property (nonatomic, strong, readonly) NSString *displayDate;


/** 只显示日期, 今天, 昨天, 前天, yy.dd */
@property (nonatomic, strong, readonly) NSString *displayStringIgnoreTime;

/** 只显示时间, N分钟前 hh:mm */
@property (nonatomic, strong, readonly) NSString *displayStringIgnoreDate;

@end
