//
//  UIViewController+Alert.m
//  KuBer
//
//  Created by 吴双 on 16/2/26.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import "UIViewController+Alert.h"


@implementation UIViewController (Alert)

- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
			   handler:(AlertHandler)handler {
	
	[self alertWithTitle:title message:message buttonTitles:buttonTitles cancelButtonIndex:MUAlertButtonNone destructiveButtonIndex:MUAlertButtonNone handler:handler];
}

- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
destructiveButtonIndex:(NSInteger)destructiveButtonIndex
			   handler:(AlertHandler)handler {
	
	[self alertWithTitle:title message:message buttonTitles:buttonTitles cancelButtonIndex:MUAlertButtonNone destructiveButtonIndex:destructiveButtonIndex handler:handler];
}

- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
	 cancelButtonIndex:(NSInteger)cancelButtonIndex
			   handler:(AlertHandler)handler {
	
	[self alertWithTitle:title message:message buttonTitles:buttonTitles cancelButtonIndex:cancelButtonIndex destructiveButtonIndex:MUAlertButtonNone handler:handler];
}

- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
	 cancelButtonIndex:(NSInteger)cancelButtonIndex
destructiveButtonIndex:(NSInteger)destructiveButtonIndex
			   handler:(AlertHandler)handler {
	
	[self alertWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert buttonTitles:buttonTitles cancelButtonIndex:cancelButtonIndex destructiveButtonIndex:destructiveButtonIndex handler:handler];
}

- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				 buttonTitle:(NSArray<NSString *> *)buttonTitle
					 handler:(AlertHandler)handler {
	[self actionSheetWithTitle:title message:message buttonTitles:buttonTitle cancelButtonIndex:MUAlertButtonNone destructiveButtonIndex:MUAlertButtonNone handler:handler
	 ];
}

- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				buttonTitles:(NSArray<NSString *> *)buttonTitles
		   cancelButtonIndex:(NSInteger)cancelButtonIndex
					 handler:(AlertHandler)handler {
	
	[self actionSheetWithTitle:title message:message buttonTitles:buttonTitles cancelButtonIndex:cancelButtonIndex destructiveButtonIndex:MUAlertButtonNone handler:handler];
}

- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				buttonTitles:(NSArray<NSString *> *)buttonTitles
	  destructiveButtonIndex:(NSInteger)destructiveButtonIndex
					 handler:(AlertHandler)handler {
	
	[self actionSheetWithTitle:title message:message buttonTitles:buttonTitles cancelButtonIndex:MUAlertButtonNone destructiveButtonIndex:destructiveButtonIndex handler:handler];
}

- (void)actionSheetWithTitle:(NSString *)title
					 message:(NSString *)message
				buttonTitles:(NSArray<NSString *> *)buttonTitles
		   cancelButtonIndex:(NSInteger)cancelButtonIndex
	  destructiveButtonIndex:(NSInteger)destructiveButtonIndex
					 handler:(AlertHandler)handler {
	
	[self alertWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet buttonTitles:buttonTitles cancelButtonIndex:cancelButtonIndex destructiveButtonIndex:destructiveButtonIndex handler:handler];
}

- (void)alertWithTitle:(NSString *)title
			   message:(NSString *)message
		preferredStyle:(UIAlertControllerStyle)preferredStyle
		  buttonTitles:(NSArray<NSString *> *)buttonTitles
	 cancelButtonIndex:(NSInteger)cancelButtonIndex
destructiveButtonIndex:(NSInteger)destructiveButtonIndex
						handler:(AlertHandler)handler {
	
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle buttonTitles:buttonTitles cancelButtonIndex:cancelButtonIndex destructiveButtonIndex:destructiveButtonIndex handler:handler];
	[self presentViewController:alert];
}

- (void)presentViewController:(UIViewController *)viewController {
	if (viewController) {
		[self presentViewController:viewController animated:YES completion:nil];
	}
}

@end

@implementation UIAlertController (Factory)

+ (UIAlertController *)alertControllerWithTitle:(NSString *)title
										message:(NSString *)message
								 preferredStyle:(UIAlertControllerStyle)preferredStyle
								   buttonTitles:(NSArray<NSString *> *)buttonTitles
							  cancelButtonIndex:(NSInteger)cancelButtonIndex
						 destructiveButtonIndex:(NSInteger)destructiveButtonIndex
										handler:(AlertHandler)handler {
	
	// index Legal
	if (![self indexLegal:cancelButtonIndex withCount:buttonTitles.count]) {
		cancelButtonIndex = MUAlertButtonNone;
	}
	if (![self indexLegal:destructiveButtonIndex withCount:buttonTitles.count]) {
		destructiveButtonIndex = MUAlertButtonNone;
	}
	
	// Create alert controller
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
	
	// Loop variable
	NSInteger currentIndex = 0;
	UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
	
	// Loop
	for (NSString *buttonTitle in buttonTitles) {
		
		// Set action style
		if (cancelButtonIndex == currentIndex) {
			actionStyle = UIAlertActionStyleCancel;
		}
		if (destructiveButtonIndex == currentIndex) {
			actionStyle = UIAlertActionStyleDestructive;
		}
		
		// Set action handler
		if (handler) {
			[alert addAction:[UIAlertAction actionWithTitle:buttonTitle style:actionStyle handler:^(UIAlertAction * _Nonnull action) {
				handler(currentIndex);
			}]];
		} else {
			[alert addAction:[UIAlertAction actionWithTitle:buttonTitle style:actionStyle handler:nil]];
		}
		
		// CurrentIndex add
		currentIndex ++;
	}
	
	return alert;
}

+ (BOOL)indexLegal:(NSInteger)index withCount:(NSUInteger)count {
	if (index >= 0 && index <= count) {
		return YES;
	} else if (index == MUAlertButtonNone) {
		return YES;
	} else {
		return NO;
	}
}

@end

