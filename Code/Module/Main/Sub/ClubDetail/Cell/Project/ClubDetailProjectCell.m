//
//  ClubDetailProjectCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailProjectCell.h"

@implementation ClubDetailProjectCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_tech";
    ClubDetailProjectCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailProjectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"ClubDetailProject.xml" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    
}
@end
