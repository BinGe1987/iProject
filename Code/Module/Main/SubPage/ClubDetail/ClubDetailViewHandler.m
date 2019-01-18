//
//  ClubDetailViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailViewHandler.h"
#import "ClubDetailAdapter.h"

@interface ClubDetailViewHandler()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *commentButton, *followButtonTop, *followButtonBottom;
@property (nonatomic, assign) BOOL first;

@end

@implementation ClubDetailViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    WeakSelf(self)
    UIView *bg = [view findViewByName:@"bottomBg"];
    [bg setViewVisibility:ViewVisibilityInvisible];
    self.commentButton = [view findViewByName:@"btn_comment"];
    [self.commentButton setViewVisibility:ViewVisibilityInvisible];
    [self.commentButton setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"PublicCommentController" animated:YES data:[button currentViewController].intentData];
    }];
    
    self.first = YES;
    self.tableView = [view findViewByName:@"table"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.tableView setHeadRefreshHandler:^{
        [weakself.tableView performSelector:@selector(finishHeadRefresh) withObject:nil afterDelay:1.5];
    }];
    [self.tableView beginHeadRefreshing];
    
    self.followButtonBottom = [[self.view currentViewController].navigationView findViewByName:@"btn_follow_bottom"];
    self.followButtonBottom.userInteractionEnabled = NO;
    
    ClubData *club = [self.view currentViewController].intentData;
    self.followButtonTop = [[self.view currentViewController].navigationView findViewByName:@"btn_follow_top"];
    self.followButtonTop.userInteractionEnabled = NO;
    [self.followButtonTop setClickBlock:^(UIButton * _Nonnull button) {
        [weakself.delegate onViewAction:@"action_follow" data:club];
        button.userInteractionEnabled = NO;
        [weakself showNetworkActivityIndicatorVisible:YES];
    }];
    
    return self;
}

- (void)followStatus:(ClubData *)club {
    self.followButtonBottom.selected = club.isFollow;
    self.followButtonTop.userInteractionEnabled = YES;
    [self showNetworkActivityIndicatorVisible:NO];
}

- (void)setData:(id)data {
    [self.tableView finishHeadRefresh];
    
    if (![data isKindOfClass:[ClubDetailData class]]) {
        return;
    }
    
    
    ClubDetailData *detailData = (ClubDetailData *)data;
    ClubData *club = [self.view currentViewController].intentData;
    club.isFollow = detailData.clubData.isFollow;
    [self followStatus:club];
    
    
    NSMutableArray *sectionArray = [NSMutableArray new];
    //banner
    if (detailData.clubData.bannerList.list && detailData.clubData.bannerList.list.count > 0) {
        TableViewSection *bannerSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"banner", @"array": @[detailData.clubData.bannerList.list], @"height" : [NSNumber numberWithFloat:ScaleValue(188)]}];
        [sectionArray addObject:bannerSection];
    }
    
    //会所信息
    TableViewSection *profileSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"profile", @"array": @[detailData.clubData], @"height" : [NSNumber numberWithFloat:125]}];
    [sectionArray addObject:profileSection];
    
    //广告条
    TableViewSection *adSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"ad", @"array": @[detailData.clubData], @"height" : [NSNumber numberWithFloat:ScaleValue(31)]}];
    [sectionArray addObject:adSection];
    
    //技师数据
    if (detailData.techList.list && detailData.techList.list.count > 0) {
        TableViewSection *techSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"tech", @"array": @[detailData.techList.list], @"height" : [NSNumber numberWithFloat:157]}];
        [sectionArray addObject:techSection];
    }
    
    //项目数据
    TableViewSection *projectSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"service", @"array": detailData.serviceList.list, @"height" : [NSNumber numberWithFloat:84],@"headerHeight" : [NSNumber numberWithFloat:42],@"footerHeight" : [NSNumber numberWithFloat:32]}];
    [sectionArray addObject:projectSection];
    
    //评论数据
    TableViewSection *commentSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"comment", @"array": @[detailData.commentList.list], @"height" : [NSNumber numberWithFloat:316]}];
    NSMutableArray *rows = [NSMutableArray new];
    for (CommentData *comment in detailData.commentList.list) {
        TableViewSectionRow *row = [TableViewSectionRow new];
        if (comment.imageList.list.count > 0) {
            row.height = commentSection.height;
        } else {
            row.height = 215;
        }
        [rows addObject:row];
    }
    commentSection.rows = rows;
    if (commentSection.rows.count == 0) {
        commentSection.height = 80;
    }
    
    [sectionArray addObject:commentSection];
    
    if (self.first) {
        self.tableView.alpha = 0;
        self.first = NO;
    }
    
    ClubDetailAdapter *adapter = [ClubDetailAdapter AdapterWithSourceData:sectionArray];
    [self.tableView setAdapter:adapter];
    [self.tableView reloadData];
    WeakSelf(self)
    [UIView animateWithDuration:0.25 animations:^{
        weakself.tableView.alpha = 1;
    }];
    
    
    UIView *bg = [self.view findViewByName:@"bottomBg"];
    [bg setViewVisibility:ViewVisibilityVisible];
    [self.commentButton setViewVisibility:ViewVisibilityVisible];
    
//    [self.tableView setFootRefreshHandler:nil];
}

@end
