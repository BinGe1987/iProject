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

@property (nonatomic, assign) BOOL fixTop;

///view的外左边距
@property (nonatomic, assign) NSInteger marginLeft;
///view的外上边距
@property (nonatomic, assign) NSInteger marginTop;
///view的外右边距
@property (nonatomic, assign) NSInteger marginRight;
///view的外下边距
@property (nonatomic, assign) NSInteger marginBottom;

-(instancetype)initWithModel:(id<UIModel>)model;

@end

NS_ASSUME_NONNULL_END
