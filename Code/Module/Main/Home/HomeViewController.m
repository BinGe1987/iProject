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

    UIButton *btn = (UIButton *)[self findViewByName:@"btn1"];
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        [Module startLoginAnimated:YES];
    }];
}

- (void)onLayoutSubViewsCompleted {
    CGFloat height = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll_view"];
    sv.contentInset = UIEdgeInsetsMake(height,0,0,0);
    sv.contentOffset = CGPointMake(0, -height);
}

@end
