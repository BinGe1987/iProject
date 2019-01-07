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
    ClubData *club = (ClubData *)data;
    
    UIImageView *clubLogo = [self.contentView findViewByName:@"image_clubLogo"];
    [clubLogo setImageWithURL:[NSURL URLWithString:club.imageUrl] placeholder:UIImageDefault_Club];
    
    UILabel *label = [self.contentView findViewByName:@"label_clubName"];
    label.text = club.name;
    
    UILabel *star = [self.contentView findViewByName:@"label_star"];
    star.text = club.star;
    
    UILabel *commentNum = [self.contentView findViewByName:@"label_commentNun"];
    commentNum.text = [NSString stringWithFormat:@"%@条评价", club.commentNum];
    
    UILabel *location = [self.contentView findViewByName:@"label_location"];
    location.text = [NSString stringWithFormat:@"%@ %@ %@km", club.regionName, club.areaName, club.distance];
    
    UILabel *classify = [self.contentView findViewByName:@"label_classify"];
    classify.text = club.tag;
    
    UILabel *discount = [self.contentView findViewByName:@"label_discount"];
    NSString * discountText = [NSString stringWithFormat:@"%.1f折" ,club.discount/100.0];
    discount.text = discountText;
    NSMutableAttributedString *attribut = [[NSMutableAttributedString alloc]initWithString:discountText];
    NSRange range = [discountText rangeOfString:@"折"];
    NSRange pointRange = NSMakeRange(0, range.location);
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName, nil];
    [attribut addAttributes:dic range:pointRange];
    NSRange pointRange1 = NSMakeRange(range.location, 1);
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName, nil];
    [attribut addAttributes:dic1 range:pointRange1];
    
    discount.attributedText = attribut;
    
    
    UILabel *maxDiscount = [self.contentView findViewByName:@"label_maxDiscount"];
    NSString *value = [NSString stringWithFormat:@"%.02f" ,club.clubDiscount/100.0];
    NSString *maxDiscountText = [NSString stringWithFormat:@"升级会员最高享%.1f折" ,club.clubDiscount/100.0];
    NSMutableAttributedString *attributMax = [[NSMutableAttributedString alloc]initWithString:maxDiscountText];
    NSRange pointRange2 = NSMakeRange(7, value.length-1);
    NSMutableDictionary *dic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil];
    [attributMax addAttributes:dic2 range:pointRange2];
//    NSRange pointRange3 = NSMakeRange(range.location, 1);
//    NSMutableDictionary *dic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13],NSFontAttributeName, nil];
    [attributMax addAttributes:dic2 range:pointRange2];
    
    maxDiscount.attributedText = attributMax;
    
    ViewGroup *vg = [self.contentView findViewByName:@"root"];
    [vg refreshLaoyout];
    
}
@end
