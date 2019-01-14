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

- (void)setData:(id)data {
    ViewGroup *vg = [self.contentView findViewByName:@"root"];
    
    [vg boundsAndRefreshLayout];
}

@end
