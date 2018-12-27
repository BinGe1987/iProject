//
//  UIEngine.h
//  UIEngine
//
//  Created by BinGe on 2018/11/26.
//  Copyright © 2018 Bin. All rights reserved.
//   UI引擎，实现从json或xml到view的解析


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "SingletonDefine.h"
#import "IEngineMapping.h"
#import "UIModel.h"
#import "ViewGroupModel.h"
#import "FrameViewModel.h"
#import "LinearViewModel.h"
#import "ScrollViewModel.h"
#import "ViewPagerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIEngine : NSObject

singleton_interface(UIEngine)


/**
 加载自定义Mapping
 @param mapping 自定义Mapping类
 */
- (void)loadEngineMapping:(id<IEngineMapping>)mapping;


/**
 将数据解析成界面

 @param model 源数据（json\xml）
 @return model>>view
 */
- (UIView *)parse:(id<UIModel>)model;

@end

NS_ASSUME_NONNULL_END
