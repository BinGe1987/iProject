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
    
    [self setNavigationXML:@"ClubTechListController.xml"];
    [self addPresenter:[[ClubTechListPresenter alloc] initWithView:self.view]];
}

@end
