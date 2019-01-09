//
//  LableViewParams.h
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "ViewParams.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, TextGravity) {
    
    TextGravityLeft      = 1 << 0,// 0000 0001
    TextGravityTop       = 1 << 1,// 0000 0010
    TextGravityRight     = 1 << 2,// 0000 0100
    TextGravityBottom    = 1 << 3,// 0000 1000
    TextGravityCenter    = 1 << 4 // 0001 0000
};

@class UIColor, UIFont;

@interface LabelViewParams : ViewParams

@property (nonatomic, strong) UIFont         *font;

@property (nonatomic, strong) NSString       *text;

@property (nonatomic, strong) UIColor        *textColor;

@property (nonatomic, assign) TextGravity    textGravity;

@property (nonatomic, assign) NSInteger     lines;

@end

NS_ASSUME_NONNULL_END
