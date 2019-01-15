//
//  CommentAdapter.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentAdapter.h"
#import "CommentItemCell.h"

@implementation CommentAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *section = [self.data objectAtIndex:indexPath.section];
    if ([section.name isEqualToString:@"comment"]){
        return [self commentCell:tableView cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    CommentData *comment = data.array[indexPath.row];
    if (comment.imageList.list.count) {
        return 225;
    } else {
        return 172;
    }
}

- (UITableViewCell *)commentCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    CommentItemCell * cell = [CommentItemCell tableView:tableView cellWithSize:CGSizeMake(tableView.width, data.height)];
    UIView *line = [cell.contentView findViewByName:@"line"];
    if (indexPath.row == 0) {
//        line.hidden = YES;
        [line setViewVisibility:ViewVisibilityInvisible];
    } else {
//        line.hidden = NO;
        [line setViewVisibility:ViewVisibilityVisible];
    }
    [cell setCellData:[data.array objectAtIndex:indexPath.row]];
    return cell;
}


@end
