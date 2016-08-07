//
//  NSData+Extension.m
//  CarLoan
//
//  Created by sml on 16/6/24.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "NSData+Extension.h"

@implementation NSData (Extension)


- (void )subDataWithCount:(NSInteger )count option:(SubDataOption)option{
    NSInteger rest = self.length % count;
    NSInteger num = self.length / count;
    NSData *newData;
    NSRange subRange;
    for (NSInteger i =0; i < count; i++) {
        if (i == count - 1) {
            subRange = NSMakeRange(i * num, num + rest);
        }else{
            subRange = NSMakeRange(i * num, num);
        }
        newData = [self subdataWithRange:subRange];
        if (option) {
            option(newData, i,subRange);
        }
    }
    
}


@end
