//
//  AppDelegate+Launch.m
//  iProject
//
//  Created by BinGe on 2018/12/7.
//

#import "AppDelegate+Launch.h"

@implementation AppDelegate (Launch)

- (void)launch {
    // 注:要在[self.window makeKeyAndVisible]之后添加imageView
    // 这里因为在Scheme已经设置了makeKeyAndVisible，所以这里不需要
    UIImageView *launchImageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    launchImageView.tag = 1;
    launchImageView.image = [AppDelegate launchImage];
    [self.window addSubview:launchImageView];
    [self.window bringSubviewToFront:launchImageView];
}

- (void)launchFinish:(void (^ _Nullable )(void))finish {
//     0.2 秒的延迟执行，避免因不做延迟，导致动画执行卡顿
    UIImageView *launchImageView = [self.window viewWithTag:1];
    if (launchImageView) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                launchImageView.alpha = 0.0;
                launchImageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            } completion:^(BOOL finished) {
                [launchImageView removeFromSuperview];
                if (finish) {
                    finish();
                }
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
