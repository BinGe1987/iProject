//
//  RechargeController.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "RechargeController.h"

@interface RechargeController ()

@end

@implementation RechargeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
    
    [self setContentViewWithXML:@"RechargeController.xml"];
}

- (void)onLayoutSubViewsCompleted {
//    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll"];
    sv.contentInset = UIEdgeInsetsMake(0,0,ScaleValue(60),0);
//    sv.contentOffset = CGPointMake(0, -topHeight);
}

@end
