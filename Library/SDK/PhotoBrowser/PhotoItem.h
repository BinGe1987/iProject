//
//  PhotoItem.h
//  APP
//
//  Created by BinGe on 2019/1/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoItem : NSObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, weak) UIView *view;
@property (nonatomic, weak) UIImage *image;

- (instancetype)initWithView:( UIView * _Nullable )view imageUrl:(NSString *)url;

- (instancetype)initWithView:( UIView * _Nullable )view image:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
