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
    for (NSString *imageUrl in detail.bannerList.list) {
        UIImage *image = [UIImage imageWithContentsOfFile:imageUrl];
        [array addObject:image];
    }
    [bannerView setImages:array];
}


@end
