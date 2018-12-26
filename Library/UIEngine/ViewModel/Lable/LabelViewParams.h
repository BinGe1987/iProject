//
//  LableViewParams.h
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "ViewParams.h"

NS_ASSUME_NONNULL_BEGIN

@class UIColor, UIFont;

@interface LabelViewParams : ViewParams

@property (nonatomic,strong) UIFont         *font;

@property (nonatomic, strong) NSString      *text;

@property (nonatomic,strong) UIColor        *textColor;

@end

NS_ASSUME_NONNULL_END
