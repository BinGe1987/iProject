//
//  UIView+JSON.h
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JSON)

+ (UIView *)viewWithJSON:(NSString *)name size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
