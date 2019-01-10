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
@property (nonatomic, strong) PhotoBrowser *browser;

@end

@implementation TechDetailViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIButton *btn1 = (UIButton *)[view findViewByName:@"btn_allComment1"];
    [btn1 setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"CommentController" animated:YES data:nil];
    }];
    UIButton *btn2 = (UIButton *)[view findViewByName:@"btn_allComment2"];
    [btn2 setClickBlock:^(UIButton * _Nonnull button) {
        [UIViewController pushController:@"CommentController" animated:YES data:nil];
    }];
    
    self.bannerView = [self.view findViewByName:@"banner"];
    self.bannerView.delegate = self;
    return self;
}

- (void)setData:(id)data {
    TechDetailData *detail = (TechDetailData *)data;
    
    [self banner:detail];
    [self profile:detail];
    
//    [((ViewGroup *)self.view) boundsAndRefreshLayout];
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
    if (!self.browser) {
        self.browser = [PhotoBrowser new];
    }
    [self.browser browserPhotoItems:array selectedIndex:selected delegate:self];
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
    
//    [view boundsAndRefreshLayout];
}

@end
