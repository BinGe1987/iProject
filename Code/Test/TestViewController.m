//
//  TestViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "TestViewController.h"
#import "SecondViewController.h"

@interface NotificationLogin : NSObject
@end

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
    
    WeakSelf(self)
    UIButton *btn1 = (UIButton *)[self findViewByName:@"btn1"];
    [btn1 setClickBlock:^(UIButton * _Nonnull button) {
        [weakself.navigationController pushViewController:[SecondViewController new] animated:YES];
    }];
    UIButton *btn2 = (UIButton *)[self findViewByName:@"btn2"];
    [btn2 setClickBlock:^(UIButton * _Nonnull button) {
         [EventBus postEvent:@"abc" data:@"456"];
    }];
    [EventBus addObserver:self selector:@selector(test:) event:@"abc"];
    
//    NSString *a = AppInfo.BundleIdentifier;
//    NSString *b = AppInfo.Build;
//    NSString *c = AppInfo.DisplayName;
//    NSString *d = AppInfo.Version;
//    NSString *e = AppInfo.Device;
//    NSString *f = AppInfo.SystemVersion;
//    NSString *g = AppInfo.UUID;
    
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
        NSLog(@"View Controller %@ will appear animated: %tu", aspectInfo.instance, animated);
    } error:NULL];
    
    [self aspect_hookSelector:@selector(test:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo){
        Log(@"test AspectPositionBefore");
    } error:NULL];
    [self aspect_hookSelector:@selector(test:) withOptions:AspectPositionInstead usingBlock:^(id<AspectInfo> aspectInfo){
        Log(@"test AspectPositionInstead : %@", aspectInfo.originalInvocation);
        NSInvocation *invocation = aspectInfo.originalInvocation;
        [invocation invoke];
        id arg1;
        id arg2;
        id arg3;
        //invocation 有2个隐藏参数，所以 argument 从2开始
        [invocation getArgument:&arg1 atIndex:0];
        [invocation getArgument:&arg2 atIndex:1];
        [invocation getArgument:&arg3 atIndex:2];
        Log(@"test AspectPositionInstead : %@", arg3);
    } error:NULL];
    [self aspect_hookSelector:@selector(test:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo){
        Log(@"test AspectPositionAfter");
    } error:NULL];
    
}


- (void)test:(id)data {
    Log(@"TestViewController %@",data);
}

- (void)onLayoutSubViewsCompleted {
    CGFloat height = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll_view"];
    sv.contentInset = UIEdgeInsetsMake(height,0,0,0);
    sv.contentOffset = CGPointMake(0, -height);
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    insets.bottom = self.tabBarController.tabBar.frame.size.height;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height);
}

@end
