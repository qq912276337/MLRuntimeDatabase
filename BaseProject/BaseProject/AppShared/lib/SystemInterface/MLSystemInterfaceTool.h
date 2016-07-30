//
//  MLSystemInterfaceTool.h
//  BaseProject
//
//  Created by sml on 16/7/30.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLSystemInterfaceTool : NSObject
/** 获取电池状态 */
- (CGFloat)getBatteryQuantity;
/** 获取总内存大小 */
- (long long)getTotalMemorySize;
/** 获取当前可用内存 */
- (long long)getAvailableMemorySize;
/** 获取总磁盘容量 */
-(long long)getTotalDiskSize;
/** 获取可用磁盘容量 */
-(long long)getAvailableDiskSize;
@end
