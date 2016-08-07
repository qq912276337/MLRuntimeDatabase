//
//  NSArray+Extension.h
//  CarLoan
//
//  Created by sml on 16/7/1.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

/** 数组里不能是模型 */
- (NSString *)ml_toJsonString;
@end
