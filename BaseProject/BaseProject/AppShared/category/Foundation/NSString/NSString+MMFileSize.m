//
//  NSString+MMFileSize.m
//  百思不得其姐
//
//  Created by sml on 16/6/6.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "NSString+MMFileSize.h"

@implementation NSString (MMFileSize)

- (long)fileSize{
    __block long size = 0;
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSArray *filePaths = [mgr subpathsAtPath:self];
    [filePaths enumerateObjectsUsingBlock:^(NSString * file, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *fullPath = [self stringByAppendingPathComponent:file];
        NSDictionary *attrs = [mgr attributesOfItemAtPath:fullPath error:nil];
        size += attrs.fileSize;
    }];
    MMLog(@"------fileSize:%ld-",size);
    return size;
}

- (void)fileSizeWithOption:(FileSzieOption )option{
    __block long size = 0;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        size = [self fileSize];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (option) {
                option(size);
            }
        });
    });
}

- (void)clearCacheWithOption:(ClearCacheOption )option{
    NSFileManager *mgr = [NSFileManager defaultManager];
    [mgr removeItemAtPath:self error:nil];
    [mgr createDirectoryAtPath:self withIntermediateDirectories:YES attributes:nil error:nil];
    if (option) {
        option();
    }
}



@end
