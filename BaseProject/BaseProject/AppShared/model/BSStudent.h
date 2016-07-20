//
//  BSStudent.h
//  BaseProject
//
//  Created by sml on 16/7/14.
//  Copyright © 2016年 sml. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSTeacher.h"
@interface BSStudent : NSObject

@property(nonatomic,assign)NSInteger id;
@property(nonatomic,strong)BSTeacher*tea;
//@property(nonatomic,strong)BSStudent*subStu;
@property (nonatomic, copy) NSString *name;

@end
