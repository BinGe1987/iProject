//
//  MyFollowController.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "MyFollowController.h"

#import "MyFollowClubPresenter.h"

@interface MyFollowController ()<ViewPagerDelegate>

@property (nonatomic, strong) UIButton *btnClub;
@property (nonatomic, strong) UIButton *btnTech;
@property (nonatomic, strong) UIView *selectedView;

@end

@implementation MyFollowController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的关注";
    [self setContentViewWithXML:@"MyFollowController.xml"];
    
    ViewPager *pager = (ViewPager *)[self findViewByName:@"pager"];
    pager.viewPagerDelegate = self;
    
    self.btnClub = [self findViewByName:@"btn_club"];
    [[self findViewByName:@"btn_club1"] setClickBlock:^(UIButton * _Nonnull button) {
        [pager scrollToPage:0];
    }];
    self.btnTech = [self findViewByName:@"btn_tech"];
    [[self findViewByName:@"btn_tech1"] setClickBlock:^(UIButton * _Nonnull button) {
        [pager scrollToPage:1];
    }];
    
    self.selectedView = [self findViewByName:@"view_selected"];
    
    [self viewPager:pager pageIndexDidChanged:0];
    
    [self addPresenter:[MyFollowClubPresenter presenterWithView:[self findViewByName:@"page_club"]]];
}

- (void)viewPager:(id)viewPager contentOffsetDidChanged:(CGPoint)offset {
    CGRect frame = self.selectedView.frame;
    frame.origin.x = offset.x / 2;
    self.selectedView.frame = frame;
}

- (void)viewPager:(id)viewPager pageIndexDidChanged:(NSInteger)index {
    self.btnClub.selected = !index;
    self.btnTech.selected = index;
}

@end
