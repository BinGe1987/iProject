//
//  MyFollowClubCell.m
//  APP
//
//  Created by BinGe on 2019/1/18.
//

#import "MyFollowClubCell.h"

@implementation MyFollowClubCell

- (void)initSubviews {
    UIView *view = [UIView viewWithXML:@"MyFollowClubCell.xml"];
    [self.contentView addSubview:view];
}

- (void)setCellData:(id)data {
    self.data = data;
    
    ClubData *club = data;
    ViewGroup *vg = [self.contentView findViewByName:@"root"];
    
    UIImageView *imageView = [vg findViewByName:@"image"];
    [imageView setImageWithURL:[NSURL URLWithString:club.imageUrl] placeholder: UIImageDefault_Club];
    
    UILabel *name = [vg findViewByName:@"label_name"];
    name.text = club.name;
    
    UILabel *star = [vg findViewByName:@"label_star"];
    star.text = [NSString stringWithFormat:@"%.1f", club.star];
    
    UILabel *comment = [vg findViewByName:@"label_comment_count"];
    comment.text = [NSString stringWithFormat:@"%ld条评价",[club.commentNum integerValue]];
    
    UILabel *address = [vg findViewByName:@"label_address"];
    address.text = [NSString stringWithFormat:@"%@ %@ %@km",club.regionName,club.areaName, club.distance];
    
    UILabel *tag = [vg findViewByName:@"label_tag"];
    tag.text = [NSString stringWithFormat:@"%@",club.tag];
    
    UILabel *discount = [vg findViewByName:@"label_discount"];
    discount.text = [NSString stringWithFormat:@"%.1f",club.discount];
    
    [vg layoutWithMaxWidth:SCREENWIDTH maxHeight:[self cellHeight]];
}

- (CGFloat)cellHeight {
    return ScaleValue(106);
}

@end
