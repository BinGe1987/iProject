//
//  InputViewParams.h
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "LabelViewParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface InputViewParams : LabelViewParams

@property (nonatomic, strong) NSString      *placeholder;

@property (nonatomic,strong) UIColor        *placeholderColor;

@property (nonatomic,strong) NSString       *inputType;

@end

NS_ASSUME_NONNULL_END
