//
//  UITableView+SeparatorInset.h
//  KuBer
//
//  Created by 吴双 on 16/2/29.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#define KBTableViewSeparatorInsertZero \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {\
	cell.separatorInset = UIEdgeInsetsZero;\
	cell.layoutMargins = UIEdgeInsetsZero;\
	cell.preservesSuperviewLayoutMargins = NO;\
}

@interface UITableView (SeparatorInset)

@end
