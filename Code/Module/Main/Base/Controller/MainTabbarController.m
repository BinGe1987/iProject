//
//  MainTabbarController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "MainTabbarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "MineViewController.h"


@implementation MainTabbarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIColor *selected = [UIColor redColor];
        UIColor *unselected = [UIColor greenColor];
        [self addTab:@"首页"
            selectedColor:selected
          unselectedColor:unselected
            selectedImage:[UIImage imageNamed:@"icon_tabbar_home_selected"]
          unselectedImage:[UIImage imageNamed:@"icon_tabbar_home_unselected"]
          controller:[[BaseNavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]]];
        
        [self addTab:@"发现"
            selectedColor:selected
          unselectedColor:unselected
            selectedImage:[UIImage imageNamed:@"icon_tabbar_selected"]
          unselectedImage:[UIImage imageNamed:@"icon_tabbar_unselected"]
          controller:[[BaseNavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]]];
        
        [self addTab:@"订单"
       selectedColor:selected
     unselectedColor:unselected
       selectedImage:[UIImage imageNamed:@"icon_tabbar_selected"]
     unselectedImage:[UIImage imageNamed:@"icon_tabbar_unselected"]
          controller:[[BaseNavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]]];
        
        [self addTab:@"我的"
            selectedColor:selected
          unselectedColor:unselected
            selectedImage:[UIImage imageNamed:@"icon_tabbar_mine_selected"]
          unselectedImage:[UIImage imageNamed:@"icon_tabbar_mine_unselected"]
          controller:[[BaseNavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]]];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
