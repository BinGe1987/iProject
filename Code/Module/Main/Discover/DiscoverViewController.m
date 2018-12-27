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

- (void)onLayoutSubViewsCompleted {
    CGFloat topHeight = STATUSBARHIEGHT + NVBARHIEGHT;
    UIView *club = [self findViewByName:@"page_club"];
    UIScrollView *sv = (UIScrollView *)[club findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
    
    UIView *tech = [self findViewByName:@"page_tech"];
    sv = (UIScrollView *)[tech findViewByName:@"table"];
    sv.contentInset = UIEdgeInsetsMake(topHeight,0,0,0);
    sv.contentOffset = CGPointMake(0, -topHeight);
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height - 44);
}





@end
