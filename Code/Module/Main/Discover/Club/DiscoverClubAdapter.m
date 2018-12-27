//
//  DiscoverClubAdapter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverClubAdapter.h"
#import "ClubTableViewCell.h"

@implementation DiscoverClubAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self clubCell:tableView cellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)clubCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubTableViewCell * cell = [ClubTableViewCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}


@end
