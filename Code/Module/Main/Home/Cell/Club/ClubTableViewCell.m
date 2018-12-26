//
//  ClubTableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "ClubTableViewCell.h"

@interface ClubTableViewCell()

@property (nonatomic, strong) UIView *itemView;

@end

@implementation ClubTableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterCell_Club";
    ClubTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    self.itemView = [UIView viewWithJSON:@"ClubCellItem.json" size:size];
    [self.contentView addSubview:self.itemView];
}

- (void)setData:(id)data {
    UIImageView *iv = (UIImageView *)[self.itemView findViewByName:@"image"];
    ClubData *club = (ClubData *)data;
    if ([NSString isEmpty:club.imageUrl]) {
//        iv.image = [UIImage imageNamed:@""];
    }
}
@end
