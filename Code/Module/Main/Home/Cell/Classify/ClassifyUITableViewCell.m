//
//  ClassifyUITableViewCell.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "ClassifyUITableViewCell.h"

@implementation ClassifyUITableViewCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterCell_Classify";
    ClassifyUITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClassifyUITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
//    self.bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
//    [self.contentView addSubview:self.bannerView];
    self.contentView.backgroundColor = [UIColor redColor];
}

- (void)setData:(id)data {
    
    
//    NSMutableArray *array = [NSMutableArray new];
//    for (NSString *imageUrl in data) {
//        UIImage *image = [UIImage imageWithContentsOfFile:imageUrl];
//        [array addObject:image];
//    }
//    [self.bannerView setImages:array];
}
@end
