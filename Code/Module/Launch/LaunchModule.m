//
//  LaunchModule.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "LaunchModule.h"
#import "MainTabbarController.h"

@implementation LaunchModule

+ (void)start {
    [LaunchModule setupMain];
    [LaunchModule showLaunchImage];
    
    [EventBus addObserver:self selector:@selector(launchFinish) event:EventAppLaunchCompleted];
}

+ (void)setupMain {
    //初始化主页面
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    app.window.backgroundColor = [UIColor whiteColor];
    MainTabbarController *nv = [[MainTabbarController alloc] init];
    app.window.rootViewController = nv;
    [app.window makeKeyAndVisible];
}

+ (void)showLaunchImage {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UIImageView *launchImageView = [[UIImageView alloc] initWithFrame:app.window.bounds];
    launchImageView.tag = 1;
    launchImageView.image = [LaunchModule launchImage];
    [app.window addSubview:launchImageView];
    [app.window bringSubviewToFront:launchImageView];
}

+ (void)launchFinish {
    [EventBus removeObserver:self];
    
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    UIImageView *launchImageView = [app.window viewWithTag:1];
    if (launchImageView) {
        //0.2 秒的延迟执行，避免因不做延迟，导致动画执行卡顿
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                launchImageView.alpha = 0.0;
                launchImageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            } completion:^(BOOL finished) {
                [launchImageView removeFromSuperview];
            }];
        });
    }
}

+ (UIImage *)launchImage {
    UIImage *lauchImage = nil;
    NSString *viewOrientation = nil;
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
        viewOrientation = @"Landscape";
    } else {
        viewOrientation = @"Portrait";
    }
    NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDictionary) {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
            lauchImage = [UIImage imageNamed:dict[@"UILaunchImageName"]];
        }
    }
    return lauchImage;
}

@end
