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
    
    if (![self.navigationItem.titleView isKindOfClass:[UILabel class]]) {
        UILabel *newLabel = [[[UILabel alloc] init] autorelease];
        newLabel.text = [self.title uppercaseString];
        newLabel.font = [UIFont fontWithName:@"QuicksandBold-Regular" size:22.0f];
        newLabel.textColor = [UIColor whiteColor];
        newLabel.backgroundColor = [UIColor clearColor];
        newLabel.shadowColor = [UIColor darkGrayColor];
        newLabel.shadowOffset = CGSizeMake(0, -1.f);
        [newLabel sizeToFit];
        self.navigationItem.titleView = newLabel;
    }
}

@end
