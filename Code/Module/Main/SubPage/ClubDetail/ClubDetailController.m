//
//  ClubDetailController.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailController.h"
#import "ClubDetailPresenter.h"

@implementation ClubDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.translucent = YES;
    
    [self setContentViewWithXML:@"ClubDetail.xml"];
    
    ClubData *club = self.intentData;
    self.title = club.name;
    
    ClubDetailPresenter *prsenter = [[ClubDetailPresenter alloc] initWithView:[self findViewByName:@"root"]];
    [self addPresenter:prsenter];
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,10,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}



- (void)dealloc {
    
}

@end
