//
//  ClubTechListCell.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "ClubTechListCell.h"

@interface ClubTechListCell()

@property (nonatomic, strong) ListData *techList;

@end

@implementation ClubTechListCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubTechListCell_tech";
    ClubTechListCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubTechListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"ClubTechListCell.xml" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    TechData *tech = data;
    UIImageView *imageView = [self.contentView findViewByName:@"image"];
    [imageView setImageWithURL:[NSURL URLWithString:tech.imageUrl] placeholder:UIImageDefault_Tech];
}

@end
