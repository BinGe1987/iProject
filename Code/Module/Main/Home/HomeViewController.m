//
//  HomeViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "HomeViewController.h"
#import "ScrollView.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Home.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
//
    UIButton *btn = (UIButton *)[self findViewByName:@"btn1"];
//    WeakSelf(self)
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        [Module startLoginAnimated:YES];
    }];
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

- (void)onLayoutSubViewsCompleted {
    CGFloat height = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll_view"];
    sv.contentInset = UIEdgeInsetsMake(height,0,0,0);
    sv.contentOffset = CGPointMake(0, -height);
}

@end
