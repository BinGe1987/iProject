//
//  HomeViewAdpater.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeViewAdpater.h"
#import "BannerUITableViewCell.h"
#import "ClassifyUITableViewCell.h"

@implementation HomeViewAdpater

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *section = [self.data objectAtIndex:indexPath.section];
    if ([section.name isEqualToString:@"banner"]) {
        return [self bannerCell:tableView cellForRowAtIndexPath:indexPath];
    }
    else if ([section.name isEqualToString:@"classify"]){
        return [self classifyCell:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
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

@end
