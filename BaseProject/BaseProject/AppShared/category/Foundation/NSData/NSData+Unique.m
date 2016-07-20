//
//  NSData+Unique.m
//  Tools
//
//  Created by 吴双 on 15/11/15.
//  Copyright © 2015年 Unique. All rights reserved.
//

#import "NSData+Unique.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSData (Unique)

- (NSString *)MD5 {
    const char *cStr =[self bytes];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
