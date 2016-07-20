//
//  NSArray+Extension.m
//  CarLoan
//
//  Created by sml on 16/7/1.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

- (NSString *)ml_toJsonString{
    NSData *data= [NSJSONSerialization dataWithJSONObject:self
                                                  options:NSJSONWritingPrettyPrinted
                                                    error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
