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
- (void)selectImage:(BannerView *)bannerView currentImage:(NSInteger )currentImage;

@end

@interface BannerView : UIView

@property (nonatomic , weak) id <BannerViewDelegate> delegate;

- (void)setImages:(NSArray *)addImageArray;

@end

NS_ASSUME_NONNULL_END
