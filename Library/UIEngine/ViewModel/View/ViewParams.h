//
//  ViewParams.h
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIModel.h"

typedef enum : NSUInteger {
    FULL = -1,
    AUTO = -2,
    PERCENT = 0,
    VALUE = 1
} SizeValueType;

typedef enum : NSUInteger {
    ViewVisibilityVisible,
    ViewVisibilityInvisible,
    ViewVisibilityGone
} ViewVisibility;

NS_ASSUME_NONNULL_BEGIN

@interface ViewParams : NSObject


///view的名字，可以通过名字获取view对象
@property (nonatomic, strong) NSString *name;
///view的类型，提供给mapping文件返回所对应的 ViewModel
@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) SizeValueType widthValueType;
///view的宽度
@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) SizeValueType heightValueType;
///view的高度
@property (nonatomic, assign) CGFloat height;
///view内左边距
@property (nonatomic, assign) NSInteger paddingLeft;
///view内上边距
@property (nonatomic, assign) NSInteger paddingTop;
///view内右边距
@property (nonatomic, assign) NSInteger paddingRight;
///view内下边距
@property (nonatomic, assign) NSInteger paddingBottom;
///
@property (nonatomic, strong) NSString *background;
///
@property (nonatomic, strong) NSString *backgroundSelected;
///view的透明度
@property (nonatomic, assign) CGFloat alpha;
///view的透明度
@property (nonatomic, assign) ViewVisibility visibility;

///
@property (nonatomic, assign) CGFloat borderRadius;
///
@property (nonatomic, assign) CGFloat borderWidth;
///
@property (nonatomic, strong) UIColor *borderColor;


-(instancetype)initWithModel:(id<UIModel>)model;

@end

NS_ASSUME_NONNULL_END
