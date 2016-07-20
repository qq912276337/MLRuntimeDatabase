//
//  BSUser.h
//  BaseProject
//
//  Created by sml on 16/7/14.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSStudent.h"
#import "BSTeacher.h"
@interface BSUser : NSObject

@property(nonatomic,assign)NSInteger id;
@property(nonatomic,strong)NSArray*arr;
@property(nonatomic,strong)NSData*data;
@property(nonatomic,strong)BSStudent*stu;
@property (nonatomic, copy) NSString *name;

@end
