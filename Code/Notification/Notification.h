//
//  Notification.h
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import <Foundation/Foundation.h>

#define notification_category_h(notification_name) \
@interface Notification (name) \
+ (void)add##notification_name##Observer:(id)observer selector:(SEL)selector; \
@end

#define notification_category_m(notification_name) \
@implementation Notification (notification_name) \
+ (void)add##notification_name##Observer:(id)observer selector:(SEL)selector {\
NSString *n_name = [self notification_##notification_name];\
[NotificationCenter addObserver:observer selector:selector name:n_name];\
}\
+ (NSString *)notification_##notification_name{return NSStringFromSelector(_cmd);}\
@end

NS_ASSUME_NONNULL_BEGIN

@interface Notification : NSObject

@end

NS_ASSUME_NONNULL_END

notification_category_h(Login)
