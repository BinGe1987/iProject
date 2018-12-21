//
//  Notification.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "Notification.h"
#import "NotificationCenter.h"

@interface NotificationObj : NSObject
@property (nonatomic, weak) id observer;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) NSNotificationName name;
@end
@implementation NotificationObj
@end


static NSMutableDictionary *notifyDic;
@implementation Notification

+ (void)addObserver:(id)observer selector:(SEL)selector name:(nullable NSNotificationName)name {
    
    if (!notifyDic) {
        notifyDic = [NSMutableDictionary new];
    }
    NotificationObj *obj = [NotificationObj new];
    obj.observer = observer;
    obj.selector = selector;
    obj.name = name;
    NSMutableArray *array = [notifyDic objectForKey:name];
    if (!array) {
        array = [NSMutableArray new];
        [notifyDic setObject:array forKey:name];
    }
    [array addObject:obj];
    
    [NotificationCenter addObserver:self selector:@selector(notificationCallback:) name:name];
}

+ (void)notificationCallback:(NSNotification *)notification {
    NSMutableDictionary *dic = notifyDic;
    id object = notification.object;
    NSString *name = notification.name;
    NSMutableArray *array = [dic objectForKey:name];
    for (NotificationObj *obj in [array mutableCopy]) {
        if (obj.observer) {
            [obj.observer performSelector:obj.selector withObject:object afterDelay:0];
        } else {
            [self removeObserver:obj.observer];
        }
    }
}

+ (void)removeObserver:(id)observer {
    NotificationObj *removeObject;
    for (NSMutableArray *array in [notifyDic allValues]) {
        for (NotificationObj *obj in [array mutableCopy]) {
            if (obj.observer) {
                if (obj.observer == observer) {
                    removeObject = obj;
                }
            } else {
                removeObject = obj;
            }
        }
        if (removeObject) {
            [array removeObject:removeObject];
            [NotificationCenter removeObserver:self name:removeObject.name];
        }
    }
    
}

@end

