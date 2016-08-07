//
//  MLSystemInterfaceTool.m
//  BaseProject
//
//  Created by sml on 16/7/30.
//  Copyright © 2016年 sml. All rights reserved.
//

#import "MLSystemInterfaceTool.h"
#include <mach/mach.h>
#include <sys/param.h>
#include <sys/mount.h>
@implementation MLSystemInterfaceTool

/** 获取电池状态 */
- (CGFloat)getBatteryQuantity
{
    return [[UIDevice currentDevice] batteryLevel];
}

/** 获取总内存大小 */
- (long long)getTotalMemorySize
{
    return [NSProcessInfo processInfo].physicalMemory;
}

/** 获取当前可用内存 */
- (long long)getAvailableMemorySize
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS)
    {
        return NSNotFound;
    }
    
    return ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count));
}

/** 获取总磁盘容量 */
-(long long)getTotalDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return freeSpace;
}
/** 获取可用磁盘容量 */
-(long long)getAvailableDiskSize
{
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0)
    {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return freeSpace;
}
@end
