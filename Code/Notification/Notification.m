//
//  Notification.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "Notification.h"
#import "NotificationCenter.h"

#define notification_category_h(notification_name) \
@interface Notification##notification_name : NSObject \
+ (void)add##notification_name##Observer:(id)observer selector:(SEL)selector; \
+ (void)post##notification_name##Notification:(nullable id)object;\
@end

#define notification_category_m(notification_name) \
@implementation Notification##notification_name \
+ (void)add##notification_name##Observer:(id)observer selector:(SEL)selector {\
NSString *n_name = [self notification_##notification_name];\
[NotificationCenter addObserver:observer selector:selector name:n_name];\
}\
+ (void)post##notification_name##Notification:(nullable id)object{\
[NotificationCenter postNotificationName:[self notification_##notification_name] object:object];\
}\
+ (NSString *)notification_##notification_name{return NSStringFromSelector(_cmd);}\
@end

notification_category_h(LoginStatus)
notification_category_m(LoginStatus)

@implementation Notification

+ (void)addLoginStatusObserver:(id)observer selector:(SEL)selector {
    [NotificationLoginStatus addLoginStatusObserver:observer selector:selector];
}
+ (void)postLoginStatusNotification:(id)object {
    [NotificationLoginStatus postLoginStatusNotification:object];
}

+ (void)removeObserver:(id)observer {
    
}

@end


