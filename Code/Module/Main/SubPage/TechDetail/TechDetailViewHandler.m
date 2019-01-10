//
//  TechDetailViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechDetailViewHandler.h"
#import "BannerView.h"

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
    
    return self;
}

- (void)setData:(id)data {
    TechDetailData *detail = (TechDetailData *)data;
    BannerView *bannerView = (BannerView *)[self.view findViewByName:@"banner"];
    NSMutableArray *array = [NSMutableArray new];
    for (ImageData *imageData in detail.techData.images) {
        [array addObject:imageData.imageUrl];
    }
    if (array.count) {
        [bannerView setVisibility:ViewVisibilityVisible];
        [bannerView setImages:array];
    } else {
        [bannerView setVisibility:ViewVisibilityGone];
    }
    
    [((ViewGroup *)self.view) boundsAndRefreshLayout];
}


@end
