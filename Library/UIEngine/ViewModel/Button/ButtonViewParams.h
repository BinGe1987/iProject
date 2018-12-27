//
//  ButtonParams.h
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "ViewParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface ButtonViewParams : ViewParams

@property (nonatomic,strong) UIFont         *font;

@property (nonatomic, strong) NSString      *text;

@property (nonatomic,strong) UIColor        *textColor;
@property (nonatomic,strong) UIColor        *textColorSelected;

@property (nonatomic,strong) UIImage        *imageNormal;
@property (nonatomic,strong) UIImage        *imageSelected;

@end

NS_ASSUME_NONNULL_END
