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

@end

@implementation ClubDetailViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    self.tableView.showsVerticalScrollIndicator = FALSE; //垂直滚动条
    self.tableView.showsHorizontalScrollIndicator = FALSE;//水平滚动条
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    [self.tableView setHeadRefreshHandler:^{
//    }];
    
    UIButton *btn = (UIButton *)[view findViewByName:@"btn_allComment"];
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"CommentController" animated:YES data:nil];
    }];
    
    return self;
}

- (void)setData:(id)data {
    if (![data isKindOfClass:[ClubDetailData class]]) {
        return;
    }
    
    ClubDetailData *detailData = (ClubDetailData *)data;
    NSMutableArray *sectionArray = [NSMutableArray new];
    
    //banner
    if (detailData.clubData.bannerList.list && detailData.clubData.bannerList.list.count > 0) {
        TableViewSection *bannerSection = [[TableViewSection alloc] initWithDictionary: @{@"name": @"banner", @"array": @[detailData.clubData.bannerList.list], @"height" : [NSNumber numberWithFloat:ScaleValue(138)]}];
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
    [sectionArray addObject:commentSection];
    
    ClubDetailAdapter *adapter = [ClubDetailAdapter AdapterWithSourceData:sectionArray];
    [self.tableView setAdapter:adapter];
    [self.tableView reloadData];
}

@end
