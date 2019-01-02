//
//  ClubDetailTechCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailTechCell.h"

@interface ClubDetailTechCell()

@property (nonatomic, strong) ListData *techList;

@end

@implementation ClubDetailTechCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_tech";
    ClubDetailTechCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailTechCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"ClubDetailTech.xml" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    
}

@end
