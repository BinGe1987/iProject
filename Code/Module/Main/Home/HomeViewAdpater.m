//
//  HomeViewAdpater.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeViewAdpater.h"

@implementation HomeViewAdpater

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * showUserInfoCellIdentifier = @"TableViewAdapterCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:showUserInfoCellIdentifier];
    }
    cell.textLabel.text = @"789";
    
    return cell;
}

@end
