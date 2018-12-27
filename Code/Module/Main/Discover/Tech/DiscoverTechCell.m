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
        [view onLayout];
        [self.contentView addSubview:view];
        self.itemView = view;
    }
}

@end
