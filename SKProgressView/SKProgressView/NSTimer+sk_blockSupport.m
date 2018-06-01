//
//  NSTimer+sk_blockSupport.m
//  ThePartyBuild
//
//  Created by Sakya on 17/5/8.
//  Copyright © 2017年 Sakya. All rights reserved.
//

#import "NSTimer+sk_blockSupport.h"

@implementation NSTimer (sk_blockSupport)

+ (NSTimer *)sk_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(sk_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)sk_blockInvoke:(NSTimer *)timer
{
    void (^ block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}
@end
