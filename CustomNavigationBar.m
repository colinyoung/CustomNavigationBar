#import "CustomNavigationBar.h"
#import "Swizzler.h"

@implementation CustomNavigationBar

+(void)setUp {
    Swizzle([UINavigationBar class],
             @selector(insertSubview:atIndex:),
             @selector(scInsertSubview:atIndex:));
    
    Swizzle([UINavigationBar class],
            @selector(sendSubviewToBack:),
            @selector(scSendSubviewToBack:));
    
    Swizzle([TTBaseViewController class],
            @selector(setTitle:),
            @selector(scSetTitle:));
    
    Swizzle([UINavigationBar class],
            @selector(setTitle:),
            @selector(scSetTitle:));
}

@end