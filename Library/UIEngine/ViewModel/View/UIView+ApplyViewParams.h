//
//  UIView+ApplyViewParams.h
//  APP
//
//  Created by BinGe on 2019/1/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ApplyViewParams)

- (void)applyViewParams:(ViewParams *)viewParams;
- (void)setBackgroundWithString:(NSString *)background;

@end

NS_ASSUME_NONNULL_END
