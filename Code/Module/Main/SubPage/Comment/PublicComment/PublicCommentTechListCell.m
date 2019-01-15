//
//  PublicCommentTechListCell.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "PublicCommentTechListCell.h"

@implementation PublicCommentTechListCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"PublicCommentTechListCell";
    PublicCommentTechListCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[PublicCommentTechListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    ViewGroup *vg = [UIView viewWithXML:@"PublicCommentTechListCell.xml" size:size];
    [self.contentView addSubview:vg];
}

- (void)setCellData:(id)data {
    TechData *tech = data;
    ViewGroup *vg = [self.contentView findViewByName:@"root"];
    
    UIImageView *image = [vg findViewByName:@"image"];
    [image setImageWithURL:[NSURL URLWithString:tech.imageUrl] placeholder:UIImageDefault_Tech];
    
    UILabel *name = [vg findViewByName:@"label_name"];
    name.text = tech.name;
    
    UILabel *num = [vg findViewByName:@"label_num"];
    num.text = [NSString stringWithFormat:@"(%@)", tech.number ? tech.number : @"--"];
    
    [vg boundsAndRefreshLayout];
}

- (void)tableViewCellDidSelect:(UITableView *)tableView {
    
}

@end
