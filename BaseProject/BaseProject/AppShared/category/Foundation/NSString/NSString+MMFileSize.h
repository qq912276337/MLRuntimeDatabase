//
//  NSString+MMFileSize.h
//  百思不得其姐
//
//  Created by sml on 16/6/6.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FileSzieOption)(long size);
typedef void(^ClearCacheOption)();
@interface NSString (MMFileSize)
- (long)fileSize;

- (void)fileSizeWithOption:(FileSzieOption )option;

- (void)clearCacheWithOption:(ClearCacheOption )option;
@end
