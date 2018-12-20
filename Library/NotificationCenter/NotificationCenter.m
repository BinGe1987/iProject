//
//  NotificationCenter.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "NotificationCenter.h"

@implementation NotificationCenter

+ (void)addObserver:(id)observer selector:(SEL)selector name:(nullable NSNotificationName)name {
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:nil];
}

+ (void)postNotificationName:(NSNotificationName)name object:(nullable id)object {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:nil];
}

+ (void)removeObserver:(id)observer {
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

@end
