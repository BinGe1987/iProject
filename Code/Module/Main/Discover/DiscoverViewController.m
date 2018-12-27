//
//  DiscoverViewController.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverViewController.h"
#import "DiscoverNvPresenter.h"
#import "DiscoverClubPresenter.h"
#import "DiscoverTechPresenter.h"

@interface DiscoverViewController ()

@property (nonatomic, strong) DiscoverNvPresenter *nvPresenter;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH - 20, NVBARHIEGHT)];
    self.navigationItem.titleView = view;
    self.nvPresenter = [[DiscoverNvPresenter alloc] initWithView:view];
    [self addPresenter:self.nvPresenter];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Discover.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
    
    ViewPager *pager = (ViewPager *)[self findViewByName:@"pager"];
    pager.viewPagerDelegate = self.nvPresenter;
    
    DiscoverClubPresenter *club = [[DiscoverClubPresenter alloc] initWithView:[self findViewByName:@"page_club"]];
    [self addPresenter:club];
    DiscoverTechPresenter *tech = [[DiscoverTechPresenter alloc] initWithView:[self findViewByName:@"page_tech"]];
    [self addPresenter:tech];
    
}





@end
