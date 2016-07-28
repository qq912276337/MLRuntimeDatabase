//
//  MM_Const.h
//
//  Created by sml on 16/6/6.
//  Copyright © 2016年 sml. All rights reserved.
//  宋茂林的常用语句

#ifndef MM_Const_h
#define MM_Const_h


#define MMScreenWide [UIScreen mainScreen].bounds.size.width
#define MMScreenHeight [UIScreen mainScreen].bounds.size.height
#define MMFrame(a,b,c,d) CGRectMake(a, b, c, d)
#define MMBgBackColor(a,b,c) ([UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1])

/*** 日志 ***/
#ifdef DEBUG
#define MMLog(...) NSLog(__VA_ARGS__)
#else
#define MMLog(...)
#endif

#import "NSObject+Runtime.h"
#define MLDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)

#define MMNotiFication [NSNotificationCenter defaultCenter]
#define MMApplication [UIApplication sharedApplication]
#define MMUserDefaults [NSUserDefaults standardUserDefaults]
#define MMAppHomePath_DocumentDirectory     [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define MMAppHomePath_CachesDirectory     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define MMGap 10
#define MM_IOS_Padding
#define MMRunBlock(b, p) {if(b){b(p);}}
//#define MMRunBlockWithTwoParam(b, p1, p2) {if(b){b(p1, p2);}}

//#define KBRunBlock(block)								{if(block) block(); }
//#define KBRunBlockWithParame(block, parame)				{if(block) block(parame); }
#define MMRunBlockWithParames(block, parame0, parame1)	{if(block) block(parame0, parame1); }

#define kRemobeCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
    cell.separatorInset = UIEdgeInsetsZero;\
    cell.layoutMargins = UIEdgeInsetsZero;\
    cell.preservesSuperviewLayoutMargins = NO;\
}\


#endif /* MM_Const_h */
