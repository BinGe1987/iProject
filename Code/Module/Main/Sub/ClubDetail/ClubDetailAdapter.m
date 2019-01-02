//
//  ClubDetailAdapter.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailAdapter.h"
#import "ClubDetailBannerCell.h"
#import "ClubDetailProfileCell.h"

@implementation ClubDetailAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *section = [self.data objectAtIndex:indexPath.section];
    if ([section.name isEqualToString:@"banner"]) {
        return [self bannerCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"profile"]){
        return [self profileCell:tableView cellForRowAtIndexPath:indexPath];
    }
//    else if ([section.name isEqualToString:@"tech"]){
//        return [self techCell:tableView cellForRowAtIndexPath:indexPath];
//    }
//    else if ([section.name isEqualToString:@"club"]){
//        return [self clubCell:tableView cellForRowAtIndexPath:indexPath];
//    }
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

@end
