//
//  PhotoBrowser.h
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import <Foundation/Foundation.h>
#import "PhotoItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotoBrowser : NSObject

+ (void)browserPhotoItems:(NSArray<PhotoItem *> *)items selectedIndex:(NSInteger)selected;

+ (void)browserPhoto:(NSArray *)imageUrls selectedIndex:(NSInteger)selected fromSourceView:(UIImageView *)view;

+ (void)controller:(UIViewController *)controller browser:(NSArray *)array selectedIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
