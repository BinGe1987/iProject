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

#pragma mark VIEW属性
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) BOOL masksToBounds;
@property (nonatomic, assign) ViewVisibility visibility;
#pragma mark 背景相关属性
@property (nonatomic, strong) NSString *background;
@property (nonatomic, strong) NSString *backgroundSelected;
#pragma mark 大小关属性
@property (nonatomic, assign) SizeValueType widthValueType;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) SizeValueType heightValueType;
@property (nonatomic, assign) CGFloat height;
#pragma mark 内边距相关属性
@property (nonatomic, assign) NSInteger paddingLeft;
@property (nonatomic, assign) NSInteger paddingTop;
@property (nonatomic, assign) NSInteger paddingRight;
@property (nonatomic, assign) NSInteger paddingBottom;
#pragma mark 圆角相关属性
@property (nonatomic, assign) CGFloat borderRadius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;
#pragma mark 阴影相关属性
@property (nonatomic, assign) CGFloat shadowOffsetX;
@property (nonatomic, assign) CGFloat shadowOffsetY;
@property (nonatomic, assign) CGFloat shadowOpacity;
@property (nonatomic, assign) CGFloat shadowRadius;
@property (nonatomic, strong) UIColor *shadowColor;


-(instancetype)initWithModel:(id<UIModel>)model;

@end

NS_ASSUME_NONNULL_END
