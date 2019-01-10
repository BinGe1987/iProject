//
//  DiscoverTechCell.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverTechCell.h"

@interface DiscoverTechCell()

@property (nonatomic, strong) UIView *itemView;

@end

@implementation DiscoverTechCell

- (void)setData:(id)data {
    if (!self.itemView) {
        CGSize size = CGSizeMake(ScaleValue(164), ScaleValue(164));
        ViewGroup *view = (ViewGroup *)[UIView viewWithJSON:@"DiscoverTechCellItem.json" size:size];
//        [view onLayout];
        [self.contentView addSubview:view];
        self.itemView = view;
    }
    
    DiscoverTechData *techData = (DiscoverTechData *)data;
    
    UIImageView *imageView = [self.itemView findViewByName:@"image"];
    [imageView setImageWithURL:[NSURL URLWithString:techData.tech.imageUrl] placeholder:UIImageDefault_Tech];
    
    UILabel *label = [self.itemView findViewByName:@"club_name"];
    label.text = techData.club.name;
    
    label = [self.itemView findViewByName:@"tech_name"];
    label.text = [NSString stringWithFormat:@"%@ %@",techData.tech.name ,techData.tech.number];
    
    label = [self.itemView findViewByName:@"browse"];
    label.text = [NSString stringWithFormat:@"%ld浏览",techData.tech.browseNum];
    
    label = [self.itemView findViewByName:@"follow"];
    label.text = [NSString stringWithFormat:@"%ld关注",techData.tech.followNum];
    
    label = [self.itemView findViewByName:@"comment"];
    label.text = [NSString stringWithFormat:@"%ld评论",techData.tech.commentNum];
    
    ViewGroup *vg = (ViewGroup *)self.itemView;
    [vg boundsAndRefreshLayout];
    
}

@end
