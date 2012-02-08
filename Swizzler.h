//
//  Swizzler.h
//
//  Created by Blaine Schanfeldt (@blaines on github) on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

void Swizzle(Class c, SEL orig, SEL new);