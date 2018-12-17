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



@end
