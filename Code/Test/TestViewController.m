//
//  TestViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "TestViewController.h"
#import "LoginViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
    
//    NSString *value = [Store valueForKey:@"123" defaultValue:@"456"];
    
//    [ProgressHUB show];
    
    NetStatus status = [Net networkStatus];
    Log(@"NetStatus %ld", (long)status);
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
