#import "TTBaseViewController+CustomNavigationBar.h"

@implementation TTBaseViewController (CustomNavigationBar)
/*
 Yes, I know you're not supposed to override methods w/ categories.
 This adds a custom bar to virtually all view controllers in your Three20 app.
*/
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (![[self class] isSubclassOfClass:[TTPopupViewController class]]) {
        [self setNavigationBarBackgroundImage:@"nav-bar.png"
                                    tintColor:[UIColor colorWithRed:0.059f green:0.545f blue:0.753f alpha:0.2f]];
    }
    
    /* Add dropshadow to bar */    
    if ([self.navigationController.navigationBar viewWithTag:kCustomNavigationBarShadowBackgroundImageTag] == nil) {    
        UIImageView *dropShadow = [[[UIImageView alloc] initWithFrame:CGRectMake(0,44,320,10)] autorelease];
        dropShadow.image = [UIImage imageNamed:@"nav_bar_shadow.png"];
        dropShadow.tag = kCustomNavigationBarShadowBackgroundImageTag;
        [self.navigationController.navigationBar insertSubview:dropShadow atIndex:1];
    }
}

- (void)scSetTitle:(NSString*)title {
    BOOL new = ![self.title isEqualToString:title];
    
    [super setTitle:title];
    
    if (new || ![self.navigationItem.titleView isKindOfClass:[UILabel class]]) {
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
