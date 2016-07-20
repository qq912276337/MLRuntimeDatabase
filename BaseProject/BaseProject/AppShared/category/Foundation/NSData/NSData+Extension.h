//
//  NSData+Extension.h
//  CarLoan
//
//  Created by sml on 16/6/24.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SubDataOption)(NSData *data,NSInteger num, NSRange subRange);
@interface NSData (Extension)

/** 回传数据：data，第几个：num 以及range */
- (void)subDataWithCount:(NSInteger )count option:(SubDataOption )option;

@end
