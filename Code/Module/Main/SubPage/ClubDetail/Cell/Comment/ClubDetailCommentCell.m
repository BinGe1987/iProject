//
//  ClubDetailCommentCell.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailCommentCell.h"

@interface ClubDetailCommentCell()<PhotoBrowserDelegate>

@property (nonatomic, strong)PhotoBrowser *broswer;

@end

@implementation ClubDetailCommentCell

+ (instancetype)tableView:(UITableView *)tableView cellWithSize:(CGSize)size {
    static NSString *identifier = @"TableViewAdapterClubDetailCell_Comment";
    ClubDetailCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[ClubDetailCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell initWithSize:size];
        cell.broswer = [PhotoBrowser new];
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
    
    UILabel *count = [root findViewByName:@"allCommentCount"];
    count.text = [NSString stringWithFormat:@"用户评价（%ld）",[data count]];
    
    UIButton *button = [root findViewByName:@"btn_allComment"];
    [button setClickBlock:^(UIButton * _Nonnull button) {
        ClubData *club = [button currentViewController].intentData;
        [UIViewController pushController:@"CommentController" animated:YES data:club];
    }];
    
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
        tech.text = [NSString stringWithFormat:@"技师：%@%@",
                     [NSString isEmpty:comment.tech.name] ? @"" : comment.tech.name,
                     [NSString isEmpty:comment.tech.number] ? @"" : comment.tech.number
                     ];
    }
    
    UILabel *score = [root findViewByName:@"score"];
    score.text = [NSString stringWithFormat:@"评分：%0.1f", comment.score];
    
    
    UILabel *content = [root findViewByName:@"content"];
    content.text = comment.content ? comment.content : @"暂无评论。";
    
    NSInteger imageCount = comment.imageList.list.count > 4 ? 4 : comment.imageList.list.count;
    ViewGroup *imageViewGroup = [root findViewByName:@"images"];
    NSArray *imageArray = [comment.imageList.list mutableCopy];
    NSMutableArray<PhotoItem *> *imageUrls = [NSMutableArray new];
    for (int i=0; i<imageCount; i++) {
        ViewGroup *imageGroup = imageViewGroup.subviews[i];
        UIImageView *imageView = [imageGroup findViewByName:@"image"];
        ImageData *imageData = imageArray[i];
        [imageView setImageWithURL:[NSURL URLWithString:imageData.imageUrl] placeholder: UIImageDefault];
        [imageUrls addObject:[[PhotoItem alloc] initWithView:imageView imageUrl:imageData.imageUrl]];
        UIButton *button = [imageGroup findViewByName:@"button"];
        button.tag = i;
        WeakSelf(self)
        [button setClickBlock:^(UIButton * _Nonnull button) {
            [weakself.broswer browserPhotoItems:imageUrls selectedIndex:button.tag];
        }];
    }
    
    UILabel *like = [root findViewByName:@"like"];
    like.text = [NSString stringWithFormat:@"%ld", comment.likeCount];
    
    UILabel *commentCount = [root findViewByName:@"commentCount2"];
    commentCount.text = [NSString stringWithFormat:@"%ld", comment.commentCount];
    
    [root boundsAndRefreshLayout];
}

- (void)photoBrowser:(PhotoBrowser *)browser didSelectItem:(PhotoItem *)item atIndex:(NSUInteger)index {
    Log(@"12312312312");
}

@end
