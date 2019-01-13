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
    ViewGroup *root = [self.contentView findViewByName:@"root"];
    
    UIImageView *imageView = [root findViewByName:@"image"];
    [imageView setImageWithURL:[NSURL URLWithString:tech.imageUrl] placeholder:UIImageDefault_Tech];
    
    UILabel *name = [root findViewByName:@"label_name"];
    name.text = [NSString stringWithFormat:@"%@ %@",
                 [NSString isEmpty:tech.name] ? @"" : tech.name,
                 [NSString isEmpty:tech.number] ? @"" : tech.number];
    
    UILabel *score = [root findViewByName:@"label_score"];
    score.text = [NSString stringWithFormat:@"评分：%0.1f", tech.score];
    
    UILabel *follow = [root findViewByName:@"label_follow"];
    follow.text = [NSString stringWithFormat:@"%ld人关注", tech.followNum];
    
    UILabel *comment = [root findViewByName:@"label_comment"];
    comment.text = [NSString stringWithFormat:@"%ld人评价", tech.commentNum];
    
    [root boundsAndRefreshLayout];
}

@end
