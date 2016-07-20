//
//  MUCircleImageManager.m
//  KuBer
//
//  Created by 吴双 on 16/2/29.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "MUCircleImageManager.h"

#define MUSharedCircleImageManager	[self sharedCircleImageManager]
#define MUSharedCircleImageBuffer	MUSharedCircleImageManager.imageBuffer

@interface MUCircleImageManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, UIImage *> *imageBuffer;

@end

@implementation MUCircleImageManager

+ (MUCircleImageManager *)sharedCircleImageManager {
	static MUCircleImageManager *_sharedCircleImageManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedCircleImageManager = [[self alloc] init];
	});
	return _sharedCircleImageManager;
}

#pragma mark - Public method

+ (UIImage *)circleImageWithImage:(UIImage *)image {
	NSString *imageHash = [NSString stringWithFormat:@"%lu", (unsigned long)image.hash];
	UIImage *circleImage = MUSharedCircleImageBuffer[imageHash];
	if (!circleImage) {
		circleImage = [self createCircleImageWithImage:image];
		MUSharedCircleImageBuffer[imageHash] = circleImage;
	}
	return circleImage;
}

+ (void)clearRAM {
	[MUSharedCircleImageManager.imageBuffer removeAllObjects];
}

+ (void)clearROM {
	
}

#pragma mark - Private method

+ (UIImage *)createCircleImageWithImage:(UIImage *)image {
	CGSize CGImageSize = CGSizeMake(image.size.width * image.scale, image.size.height * image.scale);
	UIGraphicsBeginImageContext(CGImageSize);
	CGRect ovalRect = CGRectZero;
	ovalRect.size = CGImageSize;
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:ovalRect];
	[path addClip];
	[image drawInRect:ovalRect];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	newImage = [UIImage imageWithCGImage:newImage.CGImage scale:image.scale orientation:UIImageOrientationUp];
	return newImage;
}

- (NSMutableDictionary<NSString *,UIImage *> *)imageBuffer {
	if (!_imageBuffer) {
		_imageBuffer = [NSMutableDictionary dictionary];
	}
	return _imageBuffer;
}

@end
