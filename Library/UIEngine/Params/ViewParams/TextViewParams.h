//
//  TextViewParams.h
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewParams.h"

NS_ASSUME_NONNULL_BEGIN

@class UIColor, UIFont;

@interface TextViewParams : ViewParams

@property (nonatomic,strong) UIFont         *font;  

@property (nonatomic, strong) NSString      *text;

@property (nonatomic,strong) UIColor        *textColor;


@end

NS_ASSUME_NONNULL_END
