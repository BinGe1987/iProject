//
//  OrderTableViewAdapter.m
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "OrderTableViewAdapter.h"

@implementation OrderTableViewAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewSection *data = [self.data objectAtIndex:indexPath.section];
    static NSString *identifier = @"TableViewAdapterCell_Order";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        UIView *view = [UIView viewWithJSON:@"OrderCellItem.json" size:CGSizeMake(tableView.width, data.height)];
        [cell.contentView addSubview:view];
        
    }
    return cell;
}

@end
