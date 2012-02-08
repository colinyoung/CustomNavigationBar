#import "TTBaseViewController+CustomNavigationBar.h"

@implementation TTBaseViewController (CustomNavigationBar)
/*
 Yes, I know you're not supposed to override methods w/ categories.
 This adds a custom bar to virtually all view controllers in your Three20 app.
*/
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self setNavigationBarBackgroundImage:@"nav-bar.png"
                                tintColor:[UIColor colorWithRed:0.059f green:0.545f blue:0.753f alpha:1.0f]];
}

@end
