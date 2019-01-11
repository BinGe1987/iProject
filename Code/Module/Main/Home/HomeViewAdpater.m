//
//  HomeViewAdpater.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeViewAdpater.h"
#import "BannerUITableViewCell.h"
#import "ClassifyUITableViewCell.h"
#import "TechUITableViewCell.h"
#import "ClubTableViewCell.h"

@interface HomeViewAdpater()

@property (nonatomic, strong) UIView *header1;
@property (nonatomic, strong) UIView *header2;

@end

@implementation HomeViewAdpater

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *section = [self.data objectAtIndex:indexPath.section];
    if ([section.name isEqualToString:@"banner"]) {
        return [self bannerCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"classify"]){
        return [self classifyCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"tech"]){
        return [self techCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"club"]){
        return [self clubCell:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TableViewSection *sec = [self.data objectAtIndex:section];
    if ([sec.name isEqualToString:@"tech"]) {
        if (!self.header1) {
            CGSize size = CGSizeMake(tableView.width, sec.headerHeight);
            UIView *view = [UIView viewWithJSON:@"TechCellHeader.json" size:size];
            self.header1 = view;
        }
        return self.header1;
    }
    else if ([sec.name isEqualToString:@"club"]) {
        if (!self.header2) {
            CGSize size = CGSizeMake(tableView.width, sec.headerHeight);
            UIView *view = [UIView viewWithJSON:@"ClubCellHeader.json" size:size];
            self.header2 = view;
        }
        return self.header2;
    }
    return [UIView new];
}

- (UITableViewCell *)bannerCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    BannerUITableViewCell * cell = [BannerUITableViewCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)classifyCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClassifyUITableViewCell * cell = [ClassifyUITableViewCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)techCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    TechUITableViewCell * cell = [TechUITableViewCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

- (UITableViewCell *)clubCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubTableViewCell * cell = [ClubTableViewCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    UIView *line = [cell.contentView findViewByName:@"line"];
    if (indexPath.row == 0) {
        [line setViewVisibility:ViewVisibilityInvisible];
    } else {
        [line setViewVisibility:ViewVisibilityVisible];
    }
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    if ([data.name isEqualToString:@"club"]) {
        Data *club = [data.array objectAtIndex:indexPath.row];
        [tableView pushController:@"ClubDetailController" data:club animated:YES];
    }
}

@end
