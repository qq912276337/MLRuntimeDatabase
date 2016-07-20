//
//  MUCircleImageManager.h
//  KuBer
//
//  Created by 吴双 on 16/2/29.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MUCircleImageManager : NSObject

+ (UIImage *)circleImageWithImage:(UIImage *)image;

+ (void)clearROM;
+ (void)clearRAM;

@end
