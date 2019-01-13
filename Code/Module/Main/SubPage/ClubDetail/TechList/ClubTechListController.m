//
//  ClubTechListController.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "ClubTechListController.h"
#import "ClubTechListPresenter.h"

@interface ClubTechListController ()

@end

@implementation ClubTechListController

- (void)viewDidLoad {
    [super viewDidLoad];
    ClubData *club = self.intentData;
    self.title = club.name;
    
    [self setContentViewWithXML:@"ClubTechListController.xml"];
    [self addPresenter:[[ClubTechListPresenter alloc] initWithView:self.view]];
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

@end
