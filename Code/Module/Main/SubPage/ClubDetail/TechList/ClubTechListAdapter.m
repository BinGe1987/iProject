//
//  ClubTechListAdapter.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "ClubTechListAdapter.h"
#import "ClubTechListCell.h"

@implementation ClubTechListAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    ClubTechListCell *cell = [ClubTechListCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    [cell setData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}


@end
