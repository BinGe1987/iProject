//
//  MainViewController.m
//  APP
//
//  Created by BinGe on 2018/12/18.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil]];
}

//- (void)onLayoutSubViewsCompleted {
//    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
//    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
//    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
//    sv.contentOffset = CGPointMake(0, -topHeight);
//}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height);
}


@end
