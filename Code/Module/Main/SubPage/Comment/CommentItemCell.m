//
//  CommentItemCell.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "CommentItemCell.h"

@interface CommentItemCell()

@property (nonatomic, strong) ViewGroup *view;
@property (nonatomic, strong) PhotoBrowser *broswer;

@end

@implementation CommentItemCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterCommentList_Comment";
    CommentItemCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[CommentItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
    }
    return cell;
}

- (void)initWithSize:(CGSize)size {
    self.view = [UIView viewWithXML:@"CommentItem.xml" size:size];
    
    [self.contentView addSubview:self.view];
}

- (void)setData:(id)data {
    
    CommentData *comment = data;
    ViewGroup *root = self.view;
    
    root.viewParams.heightValueType = VALUE;
    if (comment.imageList.list.count) {
        root.viewParams.height = 225;
    } else {
        root.viewParams.height = 172;
    }
    
    UIImageView *imageView = [root findViewByName:@"headImage"];
    
    [imageView setImageWithURL:[NSURL URLWithString:comment.user.avatarUrl] placeholder:UIImageDefault_UserMan];
    
    UILabel *name = [root findViewByName:@"name"];
    name.text = comment.user.userName ? comment.user.userName : @"匿名用户";
    
    UILabel *time = [root findViewByName:@"time"];
    time.text = comment.createTime;
    
    UILabel *tech = [root findViewByName:@"tech"];
    if ([NSString isEmpty:comment.tech.name] && [NSString isEmpty:comment.tech.number]) {
        [tech setViewVisibility:ViewVisibilityGone];
    } else {
        [tech setViewVisibility:ViewVisibilityVisible];
        tech.text = [NSString stringWithFormat:@"技师：%@", [NSString isEmpty:comment.tech.name] ? @"" : comment.tech.name];
    }
    
    UILabel *score = [root findViewByName:@"score"];
    score.text = [NSString stringWithFormat:@"评分：%0.1f", comment.score];
    
    
    UILabel *content = [root findViewByName:@"content"];
    content.text = comment.content ? comment.content : @"暂无评论。";
    
    NSInteger imageCount = comment.imageList.list.count > 4 ? 4 : comment.imageList.list.count;
    ViewGroup *imageViewGroup = [root findViewByName:@"images"];
    NSArray *imageArray = [comment.imageList.list mutableCopy];
    NSMutableArray<PhotoItem *> *imageUrls = [NSMutableArray new];
    for (ViewGroup *imageGroup in imageViewGroup.subviews) {
        [imageGroup setViewVisibility:ViewVisibilityInvisible];
    }
    for (int i=0; i<imageCount; i++) {
        ViewGroup *imageGroup = imageViewGroup.subviews[i];
         [imageGroup setViewVisibility:ViewVisibilityVisible];
        UIImageView *imageView = [imageGroup findViewByName:@"image"];
        ImageData *imageData = imageArray[i];
        [imageView setImageWithURL:[NSURL URLWithString:imageData.imageUrl] placeholder: UIImageDefault];
        [imageUrls addObject:[[PhotoItem alloc] initWithView:imageView imageUrl:imageData.imageUrl]];
        UIButton *button = [imageGroup findViewByName:@"button"];
        button.tag = i;
        WeakSelf(self)
        [button setClickBlock:^(UIButton * _Nonnull button) {
            if (!weakself.broswer) {
                weakself.broswer = [PhotoBrowser new];
            }
            [weakself.broswer browserPhotoItems:imageUrls selectedIndex:button.tag];
        }];
    }
    
    UILabel *like = [root findViewByName:@"like"];
    like.text = [NSString stringWithFormat:@"%ld", comment.likeCount];
    
    UILabel *commentCount = [root findViewByName:@"commentCount2"];
    commentCount.text = [NSString stringWithFormat:@"%ld", comment.commentCount];
    
    [root boundsAndRefreshLayout];
}

@end
