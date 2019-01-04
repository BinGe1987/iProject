//
//  MineViewController.m
//  DEBUG
//
//  Created by BinGe on 2018/12/6.
//

#import "MineViewController.h"
#import "MinePresenter.h"
#import "MineNvPresenter.h"

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController.navigationBar setBackgroundImage:[ImageUtils imageWithColorHex:@"#ff3c465f" size:CGSizeMake(10, 10)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.translucent = YES;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Mine.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
    
//    self.view.backgroundColor = [ColorUtils colorWithString:@"#ff3c465f"];
    
    MinePresenter *prsenter = [[MinePresenter alloc] initWithView:[self findViewByName:@"scroll"]];
    [self addPresenter:prsenter];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH - 30, NVBARHIEGHT)];
    self.navigationItem.titleView = view;
    [self addPresenter:[[MineNvPresenter alloc] initWithView:view]];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll"];
    sv.showsVerticalScrollIndicator = NO;
    sv.showsHorizontalScrollIndicator = NO;
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height - 44);
}

@end
