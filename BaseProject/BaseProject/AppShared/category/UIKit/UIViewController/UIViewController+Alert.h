//
//  UIViewController+Alert.h
//  KuBer
//
//  Created by 吴双 on 16/2/26.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MUAlertButtonNone -1

typedef void(^AlertHandler)(NSUInteger clickIndex);


@interface UIViewController (Alert)

/**
 *  Default
 *
 *  @param title        title
 *  @param message      message
 *  @param buttonTitles buttonTitles
 *  @param handler      handler
 */
- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
			   handler:(AlertHandler)handler;

/**
 *  Destructive
 *
 *  @param title                  Title
 *  @param message                Message
 *  @param buttonTitles           Button title array
 *  @param destructiveButtonIndex Destructive button index
 *  @param handler                handler
 */
- (void)alertWithTitle:(NSString *)title
						 message:(NSString *)message
					buttonTitles:(NSArray<NSString *> *)buttonTitles
		  destructiveButtonIndex:(NSInteger)destructiveButtonIndex
						 handler:(AlertHandler)handler;

/**
 *  Cancel
 *
 *  @param title             Title
 *  @param message           Message
 *  @param buttonTitles      Button title array
 *  @param cancelButtonIndex Cancel button index
 *  @param handler           handler
 */
- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
	 cancelButtonIndex:(NSInteger)cancelButtonIndex
			   handler:(AlertHandler)handler;

/**
 *  Cancel.Destructive
 *
 *  @param title                  Title
 *  @param message                Message
 *  @param buttonTitles           Button title array
 *  @param cancelButtonIndex      Cancel button index
 *  @param destructiveButtonIndex Destructive button index
 *  @param handler                handler
 */
- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
	 cancelButtonIndex:(NSInteger)cancelButtonIndex
		destructiveButtonIndex:(NSInteger)destructiveButtonIndex
			   handler:(AlertHandler)handler;

/**
 *  Default
 *
 *  @param title       Title
 *  @param message     Message
 *  @param buttonTitle Button title array
 *  @param handler     handler
 */
- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				 buttonTitle:(NSArray<NSString *> *)buttonTitle
					 handler:(AlertHandler)handler;

/**
 *  Destructive
 *
 *  @param title                  Title
 *  @param message                Message
 *  @param buttonTitles           Button title array
 *  @param destructiveButtonIndex Destructive button index
 *  @param handler                handler
 */
- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				buttonTitles:(NSArray<NSString *> *)buttonTitles
	  destructiveButtonIndex:(NSInteger)destructiveButtonIndex
					 handler:(AlertHandler)handler;

/**
 *  Cancel
 *
 *  @param title             Title
 *  @param message           Message
 *  @param buttonTitles      Button title array
 *  @param cancelButtonIndex Cancel button Index
 *  @param handler           handler
 */
- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				buttonTitles:(NSArray<NSString *> *)buttonTitles
		   cancelButtonIndex:(NSInteger)cancelButtonIndex
					 handler:(AlertHandler)handler;

/**
 *  Cancel.Destructive
 *
 *  @param title                  Title
 *  @param message                Message
 *  @param buttonTitles           Button title array
 *  @param cancelButtonIndex      Cancel button index
 *  @param destructiveButtonIndex Destructive button index
 *  @param handler                handler
 */
- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				buttonTitles:(NSArray<NSString *> *)buttonTitles
		   cancelButtonIndex:(NSInteger)cancelButtonIndex
	  destructiveButtonIndex:(NSInteger)destructiveButtonIndex
					 handler:(AlertHandler)handler;

/**
 *  Style.Cancel.Destructive
 *
 *  @param title                  Title
 *  @param message                Message
 *  @param preferredStyle         UIAlertControllerStyle
 *  @param buttonTitles           Button title array
 *  @param cancelButtonIndex      Cancel button index
 *  @param destructiveButtonIndex Destructive button index
 *  @param handler                handler
 */
- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		preferredStyle:(UIAlertControllerStyle)preferredStyle
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
	 cancelButtonIndex:(NSInteger)cancelButtonIndex
		destructiveButtonIndex:(NSInteger)destructiveButtonIndex
			   handler:(AlertHandler)handler;

@end




@interface UIAlertController (Factory)

+ (UIAlertController *)alertControllerWithTitle:(NSString *)title
										message:(NSString *)message
								 preferredStyle:(UIAlertControllerStyle)preferredStyle
								   buttonTitles:(NSArray<NSString *> *)buttonTitles
							  cancelButtonIndex:(NSInteger)cancelButtonIndex
						 destructiveButtonIndex:(NSInteger)destructiveButtonIndex
									   handler:(AlertHandler)handler;

@end


