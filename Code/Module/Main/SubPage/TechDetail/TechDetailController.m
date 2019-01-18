//
//  TechDetailController.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechDetailController.h"
#import "TechDetailPresenter.h"

@interface TechDetailController ()

@end

@implementation TechDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    TechData *techData = self.intentData;
    if (!techData) {
        [ProgressHUB toast:@"技师信息为空"];
        return;
    }
    
    [self setContentViewWithXML:@"TechDetail.xml"];
    [self setNavigationXML:@"TechDetailNavigation.xml"];
    
    [self addPresenter:[[TechDetailPresenter alloc] initWithView:[self findViewByName:@"root"]]];
}

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,40,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

@end
