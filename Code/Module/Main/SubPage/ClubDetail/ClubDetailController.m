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
    
    ClubData *club = self.intentData;
    
    [self setContentViewWithXML:@"ClubDetail.xml"];
    [self setNavigationXML:@"ClubDetailNavigation.xml"];
    UILabel *title = [self.navigationView findViewByName:@"label_title"];
    title.text = club.name;
    
    
    [Store setValue:club.source forKey:@"test_data"];
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
