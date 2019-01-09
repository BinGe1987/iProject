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
    UIButton *btn = (UIButton *)[view findViewByName:@"btn_allComment"];
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"CommentController" animated:YES data:nil];
    }];
}

- (void)setData:(id)data {
    CommentData *comment = data[0];
    
    ViewGroup *root = [self.contentView findViewByName:@"root"];
    
    UILabel *count = [root findViewByName:@"commentCount"];
    count.text = [NSString stringWithFormat:@"全部（%ld）",[data count]];
    
    UIImageView *imageView = [root findViewByName:@"headImage"];
    [imageView setImageWithURL:[NSURL URLWithString:comment.user.avatarUrl] placeholder:UIImageDefault_UserMan];
    
    UILabel *name = [root findViewByName:@"name"];
    name.text = comment.user.userName ? comment.user.userName : @"匿名用户";
    
    UILabel *time = [root findViewByName:@"time"];
    time.text = comment.createTime;
    
    UILabel *tech = [root findViewByName:@"tech"];
    if ([NSString isEmpty:comment.tech.name] && [NSString isEmpty:comment.tech.number]) {
        [tech setVisibility:ViewVisibilityGone];
    } else {
        [tech setVisibility:ViewVisibilityVisible];
        tech.text = [NSString stringWithFormat:@"技师：%@", [NSString isEmpty:comment.tech.name] ? @"" : comment.tech.name];
    }
    
    UILabel *score = [root findViewByName:@"score"];
    score.text = [NSString stringWithFormat:@"评分：%0.1f", comment.score];
    
    
    UILabel *content = [root findViewByName:@"content"];
    content.text = comment.content ? comment.content : @"暂无评论。";
    
    [root refreshLaoyout];
}

@end
