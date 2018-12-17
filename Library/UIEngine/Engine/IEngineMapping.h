//
//  IEngineMapping.h
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModel.h"
#import "UIModel.h"

NS_ASSUME_NONNULL_BEGIN


/**
 mapping类协议，主要用于映射数据源中的type，找到其对应的ViewModel类
 也可自己实现这个协议来实现自定义ViewModel
 */
@protocol IEngineMapping <NSObject>

- (ViewModel *) getViewModel:(id<UIModel>)model;

@end

NS_ASSUME_NONNULL_END
