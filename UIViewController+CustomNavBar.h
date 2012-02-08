#import <UIKit/UIKit.h>
#import "CustomNavigationBar.h"

@interface UIViewController (CustomNavBar)

/* Call on any view controller to change the nav bar of itself or its navigation controller. */
- (void)setNavigationBarBackgroundImage:(NSString*)imageName tintColor:(UIColor *)tintColor;

@end
