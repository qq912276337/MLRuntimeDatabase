//
//  NSString+Date.m
//  KuBer
//
//  Created by 吴双 on 15/12/29.
//  Copyright © 2015年 huaxu. All rights reserved.
//

#import "NSString+Date.h"
#import "NSDate+Extension.h"

@implementation NSString (Date)

- (NSDate *)date {
	NSDateFormatter *formatter = [NSDateFormatter new];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate *date = [formatter dateFromString:self];
	return date;
}

- (NSString *)displayDate {
	return self.date.timeIntervalDescription;
}

- (NSString *)displayStringIgnoreTime {
	NSDate *date = self.date;
	if (date.isToday) {
		return @"今天";
	} else if (date.isYesterday) {
		return @"昨天";
	} else if (date.isTheDayBeforeYesterday) {
		return @"前天";
	} else {
		return [NSString stringWithFormat:@"%02lu.%02lu", (unsigned long)date.month, (unsigned long)date.day];
	}
}

- (NSString *)displayStringIgnoreDate {
	NSDate *date = self.date;
	if (date.isToday) {
		NSTimeInterval timeInterval = -date.timeIntervalSinceNow;
		//	NSLog(@"%f", timeInterval);
		if (timeInterval < 60) {
			return @"1分钟内";
		} else if (timeInterval < 3600) {
			return [NSString stringWithFormat:@"%.f分钟前", timeInterval / 60];
		} else if (timeInterval < 86400) {
			return [NSString stringWithFormat:@"%.f小时前", timeInterval / 3600];
		}
	}
	NSString *xm = date.hour > 12 ? @"PM" : @"AM";
	NSUInteger hour = date.hour > 12 ? date.hour - 12 : date.hour;
	return [NSString stringWithFormat:@"%02lu:%02lu%@", hour, (unsigned long)date.minute, xm];
}

@end
