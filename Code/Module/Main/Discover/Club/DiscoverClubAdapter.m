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
    Data *club = [data.array objectAtIndex:indexPath.row];
    [UIViewController pushController:@"ClubDetailController" animated:YES data:club];
}


@end
