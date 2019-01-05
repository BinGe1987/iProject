//
//  ProgressHUB+Tips.m
//  APP
//
//  Created by BinGe on 2019/1/5.
//

#import "ProgressHUB+Tips.h"

@implementation ProgressHUB (Tips)

static NSOperationQueue *operationQueue;

+ (void)postTips:(NSString *)tips {
    
    if (!operationQueue) {
        operationQueue = [[NSOperationQueue alloc] init];
        operationQueue.maxConcurrentOperationCount = 1;
    }
    
    [operationQueue addOperationWithBlock:^{
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        dispatch_async(dispatch_get_main_queue(), ^{
            [ProgressHUB playTipsAmination:tips completion:^(BOOL finished) {
                dispatch_semaphore_signal(semaphore);//发送信号
            }];
        });
        dispatch_semaphore_wait(semaphore,DISPATCH_TIME_FOREVER);  //等待
    }];
}

+ (void)playTipsAmination:(NSString *)tips completion:(void (^ __nullable)(BOOL finished))completion{
    UIWindow *window = TOP_WINDOW;
    CGSize screenSize = window.bounds.size;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 88, screenSize.width, 32)];
    view.layer.masksToBounds = YES;
    [window addSubview:view];
    [window bringSubviewToFront:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    label.text = tips;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16];
    label.center = CGPointMake(label.center.x, label.center.y - label.bounds.size.height);
    [view addSubview:label];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = label.frame;
        frame.origin.y = 0;
        label.frame = frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
            CGRect frame = label.frame;
            frame.origin.y = -frame.size.height;
            label.frame = frame;
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
            completion(finished);
        }];
    }];
}

@end
