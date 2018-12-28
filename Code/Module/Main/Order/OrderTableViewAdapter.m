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
        view.tag = 100;
        
    }
    
    UIView *view = [cell.contentView viewWithTag:100];
    [self view:view setData:[data.array objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)view:(UIView *)view setData:(OrderData *)order {
    UILabel *label = (UILabel *)[view findViewByName:@"pay_time"];
    label.text = order.payTime;
    
    label = (UILabel *)[view findViewByName:@"pay_type"];
    label.text = order.payType;
    
    label = (UILabel *)[view findViewByName:@"write_off_code"];
    label.text = order.writeOffCode;
    
    label = (UILabel *)[view findViewByName:@"trans_amount"];
    label.text = [NSString stringWithFormat:@"¥%.2f", order.transAmount];
    
    label = (UILabel *)[view findViewByName:@"reduce_amount"];
    label.text = [NSString stringWithFormat:@"-¥%.2f", order.reduceAmount];
    
    label = (UILabel *)[view findViewByName:@"pay_amount"];
    label.text = [NSString stringWithFormat:@"¥%.2f", order.payAmount];
}

@end
