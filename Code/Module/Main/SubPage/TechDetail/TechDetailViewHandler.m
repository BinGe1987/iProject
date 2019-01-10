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
    return self;
}

- (void)setData:(id)data {
    TechDetailData *detail = (TechDetailData *)data;
    
    [self banner:detail];
    [self profile:detail];
    [self comment:detail];
    
    [[self.view findViewByName:@"scroll"] boundsAndRefreshLayout];
}

#pragma mask banner

- (void)banner:(TechDetailData *)detail {
    NSMutableArray *array = [NSMutableArray new];
    for (ImageData *imageData in detail.techData.images) {
        [array addObject:imageData.imageUrl];
    }
    if (array.count) {
        [self.bannerView setVisibility:ViewVisibilityVisible];
        [self.bannerView setImages:array];
    } else {
        [self.bannerView setVisibility:ViewVisibilityGone];
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
    UIImageView *view = item.view;
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
    UIButton *btn2 = (UIButton *)[self.view findViewByName:@"btn_allComment2"];
    NSArray *array = detail.commentList;
    [self commentItem:[self.view findViewByName:@"comment1"] data:array.count>0 ? array[0] : nil];
    [self commentItem:[self.view findViewByName:@"comment2"] data:array.count>0 ? array[1] : nil];
    [btn2 setVisibility:ViewVisibilityVisible];
    if (!array.count) {
        [btn2 setVisibility:ViewVisibilityInvisible];
    }
}

- (void)commentItem:(ViewGroup *)root data:(CommentData *)comment {
    if (comment) {
        if (comment.imageList.list.count == 0) {
            root.viewParams.height = 170;
        } else {
            root.viewParams.height = 242;
        }
        
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
        [root setVisibility:ViewVisibilityGone];
    }
}


@end
