//
//  LayoutParams.h
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LayoutParams : NSObject
///位置是否往下推，状态栏的高度
@property (nonatomic, assign) BOOL fixTop;
///view的外左边距
@property (nonatomic, assign) CGFloat marginLeft;
///view的外上边距
@property (nonatomic, assign) CGFloat marginTop;
///view的外右边距
@property (nonatomic, assign) CGFloat marginRight;
///view的外下边距
@property (nonatomic, assign) CGFloat marginBottom;

-(instancetype)initWithModel:(id<UIModel>)model;

@end

NS_ASSUME_NONNULL_END
