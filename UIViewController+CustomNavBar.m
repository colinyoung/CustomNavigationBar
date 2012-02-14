#import "UIViewController+CustomNavBar.h"

@implementation UIViewController (CustomNavBar)

- (void)setNavigationBarBackgroundImage:(NSString*)imageName tintColor:(UIColor *)tintColor
{
    UINavigationController *navController = [self isKindOfClass:[UINavigationController class]] ?
        (UINavigationController*)self : self.navigationController;
    UINavigationBar *navBar = [navController navigationBar];
    navBar.tintColor = tintColor;
    
    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [navBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
    } else {
        UIImageView *imageView = (UIImageView *)[navBar viewWithTag:kCustomNavigationBarBackgroundImageTag];
        if (imageView == nil) {
            imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
            [imageView setTag:kCustomNavigationBarBackgroundImageTag];
            [navBar insertSubview:imageView atIndex:0];
        }
    }
}

@end
