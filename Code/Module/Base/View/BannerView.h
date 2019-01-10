//
//  BannerView.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <UIKit/UIKit.h>
#import "BannerItem.h"

NS_ASSUME_NONNULL_BEGIN
@class BannerView;

@protocol BannerViewDelegate <NSObject>

@optional //可选
- (void)bannerView:(BannerView *)bannerView selectedIndex:(NSInteger)selected;
- (void)bannerView:(BannerView *)bannerView imageView:(UIImageView *)imageView;
- (void)bannerView:(BannerView *)bannerView imageView:(UIImageView *)imageView selectedIndex:(NSInteger)selected;

@end

@interface BannerView : UIView

@property (nonatomic , weak) id <BannerViewDelegate> delegate;

- (void)setImages:(NSArray *)addImageArray;

- (NSArray *)getImageViews;

- (NSArray *)getBannerItems;

- (void)scrollToView:(UIImageView *)view;

@end

NS_ASSUME_NONNULL_END
