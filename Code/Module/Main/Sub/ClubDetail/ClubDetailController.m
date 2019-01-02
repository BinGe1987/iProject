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
    [self setContentViewWithXML:@"ClubDetail.xml"];
    
    ClubDetailPresenter *prsenter = [[ClubDetailPresenter alloc] initWithView:[self findViewByName:@"table"]];
    [self addPresenter:prsenter];
}


@end
