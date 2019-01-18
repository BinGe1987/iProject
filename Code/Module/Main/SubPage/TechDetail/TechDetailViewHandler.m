//
//  TechDetailViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechDetailViewHandler.h"
#import "BannerView.h"

@interface TechDetailViewHandler()<BannerViewDelegate, PhotoBrowserDelegate>

@property (nonatomic, strong) BannerView *bannerView;
@property (nonatomic, strong) PhotoBrowser *broswer;

@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIButton *followBtnBottom, *followBtnTop;
@property (nonatomic, assign) BOOL first;

@property (nonatomic, strong) TechDetailData *detail;

@end

@implementation TechDetailViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    id click = ^(UIButton * _Nonnull button) {
        TechData *tech = [button currentViewController].intentData;
        [UIViewController pushController:@"CommentController" animated:YES data:tech];
    };
    
    UIButton *btn1 = (UIButton *)[view findViewByName:@"btn_allComment1"];
    [btn1 setClickBlock:click];
    UIButton *btn2 = (UIButton *)[view findViewByName:@"btn_allComment2"];
    [btn2 setClickBlock:click];
    
    self.bannerView = [self.view findViewByName:@"banner"];
    self.bannerView.delegate = self;
    
    UIView *bg = [view findViewByName:@"bottomBg"];
    [bg setViewVisibility:ViewVisibilityInvisible];
    self.commentButton = [view findViewByName:@"btn_comment"];
    [self.commentButton setViewVisibility:ViewVisibilityInvisible];
    WeakSelf(self)
    [self.commentButton setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"PublicCommentController" animated:YES data:weakself.detail];
    }];
    
    self.first = YES;
    
    self.followBtnBottom = [[self.view currentViewController].navigationView findViewByName:@"btn_follow_bottom"];
    self.followBtnBottom.userInteractionEnabled = NO;
    self.followBtnTop = [[self.view currentViewController].navigationView findViewByName:@"btn_follow_top"];
    self.followBtnTop.userInteractionEnabled = NO;
    TechData *tech = [self.view currentViewController].intentData;
    [self.followBtnTop setClickBlock:^(UIButton * _Nonnull button) {
        [weakself.delegate onViewAction:@"action_follow" data:tech];
        button.userInteractionEnabled = NO;
        [weakself showNetworkActivityIndicatorVisible:YES];
    }];
    
    
    return self;
}

- (void)setFollowStatus:(TechData *)tech {
    self.followBtnTop.userInteractionEnabled = YES;
    self.followBtnBottom.selected = tech.isFollow;
}

- (void)setData:(id)data {
    UIView *bg = [self.view findViewByName:@"bottomBg"];
    [bg setViewVisibility:ViewVisibilityVisible];
    [self.commentButton setViewVisibility:ViewVisibilityVisible];
    
    TechDetailData *detail = (TechDetailData *)data;
    self.detail = data;
    TechData *tech = [self.view currentViewController].intentData;
    tech.isFollow = detail.techData.isFollow;
    
    UILabel *titleLabel = [[self.view currentViewController].navigationView findViewByName:@"label_title"];
    titleLabel.text = detail.clubData.name;
    
    [self setFollowStatus:detail.techData];
    
    [self banner:detail];
    [self profile:detail];
    [self comment:detail];
    
    ViewGroup *scroll = [self.view findViewByName:@"scroll"];
    [scroll boundsAndRefreshLayout];
    if (self.first) {
        scroll.hidden = NO;
        scroll.alpha = 0;
        [UIView animateWithDuration:0.5 animations:^{
            scroll.alpha = 1;
        }];
        self.first = NO;
    }
}

#pragma mask banner

- (void)banner:(TechDetailData *)detail {
    NSMutableArray *array = [NSMutableArray new];
    for (ImageData *imageData in detail.techData.images) {
        [array addObject:imageData.imageUrl];
    }
    if (array.count) {
        [self.bannerView setViewVisibility:ViewVisibilityVisible];
        [self.bannerView setImages:array];
    } else {
        [self.bannerView setViewVisibility:ViewVisibilityGone];
    }
}

- (void)bannerView:(BannerView *)bannerView selectedIndex:(NSInteger)selected {
    NSMutableArray<PhotoItem *> *array = [NSMutableArray new];
    NSArray *items = [bannerView getBannerItems];
    for (int i=0;i<items.count;i++) {
        BannerItem *item = items[i];
        [array addObject:[[PhotoItem alloc] initWithView:item.view imageUrl:item.url]];
    }
    if (!self.broswer) {
        self.broswer = [PhotoBrowser new];
    }
    [self.broswer browserPhotoItems:array selectedIndex:selected delegate:self];
}

- (void)photoBrowser:(PhotoBrowser *)browser didSelectItem:(PhotoItem *)item atIndex:(NSUInteger)index {
    UIImageView *view = (UIImageView *)item.view;
    if (view) {
        [self.bannerView scrollToView:view];
    }
}

#pragma mask 技师数据
- (void)profile:(TechDetailData *)detail {
    ViewGroup *view = [self.view findViewByName:@"profile"];
    
    UILabel *label = [view findViewByName:@"label_name"];
    label.text = detail.techData.name;
    
    label = [view findViewByName:@"label_follow"];
    label.text = [NSString stringWithFormat:@"%ld人关注",detail.techData.followNum];
    
    label = [view findViewByName:@"label_score"];
    label.text = [NSString stringWithFormat:@"%.1f",detail.techData.score];
    
    label = [view findViewByName:@"label_address"];
    label.text = [NSString stringWithFormat:@"%@",detail.clubData.address];
}

#pragma mask 技师评论
- (void)comment:(TechDetailData *)detail {
    
    UIButton *btn1 = (UIButton *)[self.view findViewByName:@"btn_allComment1"];
    UIButton *btn2 = (UIButton *)[self.view findViewByName:@"btn_allComment2"];
    
    NSArray *array = detail.commentList;
    [self commentItem:[self.view findViewByName:@"comment1"] data:array.count>0 ? array[0] : nil];
    [self commentItem:[self.view findViewByName:@"comment2"] data:array.count>0 ? array[1] : nil];
    [btn1 setViewVisibility:ViewVisibilityVisible];
    [btn2 setViewVisibility:ViewVisibilityVisible];
    if (!array.count) {
        [btn1 setViewVisibility:ViewVisibilityInvisible];
        [btn2 setViewVisibility:ViewVisibilityInvisible];
    }
    
    
}

- (void)commentItem:(ViewGroup *)root data:(CommentData *)comment {
    if (comment) {
        if (comment.imageList.list.count == 0) {
            root.viewParams.height = 170;
        } else {
            root.viewParams.height = 242;
        }
        [root setViewVisibility:ViewVisibilityVisible];
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
        
        
    } else {
        [root setViewVisibility:ViewVisibilityGone];
    }
}


@end
