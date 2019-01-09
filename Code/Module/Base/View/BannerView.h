//
//  BannerView.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BannerView;

@protocol BannerViewDelegate <NSObject>

@optional //可选
- (void)bannerView:(BannerView *)bannerView imageView:(UIImageView *)imageView;
- (void)bannerView:(BannerView *)bannerView imageView:(UIImageView *)imageView selectedIndex:(NSInteger)selected;

@end

@interface BannerView : UIView

@property (nonatomic , weak) id <BannerViewDelegate> delegate;

- (void)setImages:(NSArray *)addImageArray;

@end

NS_ASSUME_NONNULL_END
