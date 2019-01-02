//
//  ClubDetailCommentCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailCommentCell.h"

@implementation ClubDetailCommentCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_Comment";
    ClubDetailCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    UIView *view = [UIView viewWithXML:@"ClubDetailComment.xml" size:size];
    [self.contentView addSubview:view];
}

- (void)setData:(id)data {
    
}

@end
