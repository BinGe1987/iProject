//
//  ClubDetailAdTableViewCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailAdCell.h"

@implementation ClubDetailAdCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_Ad";
    ClubDetailAdCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailAdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"ClubDetailAd.xml" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    
}


@end
