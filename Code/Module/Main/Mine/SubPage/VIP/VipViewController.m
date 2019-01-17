//
//  VipViewController.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "VipViewController.h"

@interface VipViewController ()

@end

@implementation VipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的会员";
    
    [self setContentViewWithXML:@"VipViewController.xml"];
}

- (void)onLayoutSubViewsCompleted {
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll"];
    sv.contentInset = UIEdgeInsetsMake(0,0,ScaleValue(60),0);
}

@end
