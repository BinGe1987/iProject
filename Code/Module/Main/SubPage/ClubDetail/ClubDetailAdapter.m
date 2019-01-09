//
//  ClubDetailAdapter.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailAdapter.h"
#import "ClubDetailBannerCell.h"
#import "ClubDetailProfileCell.h"
#import "ClubDetailAdCell.h"
#import "ClubDetailTechCell.h"
#import "ClubDetailProjectCell.h"
#import "ClubDetailCommentCell.h"

@interface ClubDetailAdapter()

@property (nonatomic, strong) UIView *serviceFootView;

@end

@implementation ClubDetailAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *section = [self.data objectAtIndex:indexPath.section];
    if ([section.name isEqualToString:@"banner"]) {
        return [self bannerCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"profile"]){
        return [self profileCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"ad"]){
        return [self adCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"tech"]){
        return [self techCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"service"]){
        return [self serviceCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"comment"]){
        return [self commentCell:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (UITableViewCell *)bannerCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubDetailBannerCell * cell = [ClubDetailBannerCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)profileCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubDetailProfileCell * cell = [ClubDetailProfileCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)adCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubDetailAdCell * cell = [ClubDetailAdCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)techCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubDetailTechCell * cell = [ClubDetailTechCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)serviceCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubDetailProjectCell * cell = [ClubDetailProjectCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

static bool noMore;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TableViewSection *tvSection = [self.data objectAtIndex:section];
    NSInteger count = [tvSection.array count];
    if ([tvSection.name isEqualToString:@"service"]) {
        count = noMore ? count : (count < 3 ? count : 3);
    }
    return count;
}

#pragma mark 头部
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableViewSection *sec = [self.data objectAtIndex:section];
    CGSize size = CGSizeMake(tableView.width, sec.headerHeight);
    UIView *view = [UIView viewWithXML:@"ClubDetailServiceHead.xml" size:size];
    return view;
}

#pragma mark 底部
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    TableViewSection *sec = [self.data objectAtIndex:section];
    if ([sec.name isEqualToString:@"service"]) {
        if (sec.array.count <= 3) {
            return [super tableView:tableView viewForFooterInSection:section];
        }
        if (!self.serviceFootView) {
            CGSize size = CGSizeMake(tableView.width, sec.footerHeight);
            self.serviceFootView = [UIView viewWithXML:@"ClubDetailServiceFoot.xml" size:size];
            UIView *moreView = [self.serviceFootView findViewByName:@"more"];
            UIView *nomoreView = [self.serviceFootView findViewByName:@"nomore"];
            [moreView setVisibility:ViewVisibilityVisible];
            [nomoreView setVisibility:ViewVisibilityInvisible];
            UIButton *btn = [self.serviceFootView findViewByName:@"btn_more"];
            [btn setClickBlock:^(UIButton * _Nonnull button) {
                noMore = !noMore;
                NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:section];
                [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
                
                if (!noMore) {
                    [moreView setVisibility:ViewVisibilityVisible];
                    [nomoreView setVisibility:ViewVisibilityInvisible];
                } else {
                    [moreView setVisibility:ViewVisibilityInvisible];
                    [nomoreView setVisibility:ViewVisibilityVisible];
                }
                
            }];
        }
        return self.serviceFootView;
    } else {
        return [super tableView:tableView viewForFooterInSection:section];
    }
    
}


- (UITableViewCell *)commentCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubDetailCommentCell * cell = [ClubDetailCommentCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

@end
