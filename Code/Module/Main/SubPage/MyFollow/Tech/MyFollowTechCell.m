//
//  MyFollowTechCell.m
//  APP
//
//  Created by BinGe on 2019/1/21.
//

#import "MyFollowTechCell.h"

@implementation MyFollowTechCell

- (void)initSubviews {
    UIView *view = [UIView viewWithXML:@"MyFollowTechCell.xml"];
    [self.contentView addSubview:view];
}

- (void)setCellData:(id)data {
    self.data = data;
    TechData *tech = data;
    
    ViewGroup *vg = [self.contentView findViewByName:@"root"];
    
    UIImageView *imageView = [vg findViewByName:@"image"];
    [imageView setImageWithURL:[NSURL URLWithString:tech.imageUrl] placeholder: UIImageDefault_Tech];
    
    UILabel *name = [vg findViewByName:@"label_name"];
    name.text = tech.name;
    
    UILabel *score = [vg findViewByName:@"label_score"];
    score.text = [NSString stringWithFormat:@"%.1f",tech.score];
    
    UILabel *follow = [vg findViewByName:@"label_follow"];
    follow.text = [NSString stringWithFormat:@"%ld人关注",tech.followNum];
    
    UILabel *comment = [vg findViewByName:@"label_comment"];
    comment.text = [NSString stringWithFormat:@"%ld人评价",tech.commentNum];
    
    [vg layoutWithMaxWidth:SCREENWIDTH maxHeight:[self cellHeight]];
}

- (void)tableViewCellDidSelect:(UITableView *)tableView {
    [UIViewController pushController:@"TechDetailController" animated:YES data:self.data];
}

- (CGFloat)cellHeight {
    return ScaleValue(78);
}

@end
