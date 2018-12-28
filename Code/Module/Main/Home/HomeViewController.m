//
//  HomeViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "HomeViewController.h"
#import "HomeNvPresenter.h"
#import "HomePresenter.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Home.json" ofType:nil];
    [self setContentViewWithJSONPath:path];

    HomePresenter *prsenter = [[HomePresenter alloc] initWithView:[self findViewByName:@"table"]];
    [self addPresenter:prsenter];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH - 20, NVBARHIEGHT)];
    self.navigationItem.titleView = view;
    [self addPresenter:[[HomeNvPresenter alloc] initWithView:view]];
}

- (void)viewWillAppear:(BOOL)animated {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
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
