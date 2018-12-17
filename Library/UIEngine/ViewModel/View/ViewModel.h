//
//  ViewModel.h
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+View.h"
#import "CommonHeader.h"

NS_ASSUME_NONNULL_BEGIN

/**
 view和model的关系层
 */
@interface ViewModel : NSObject

@property (nonatomic, weak) id model;

@property (nonatomic, strong) UIView* view;

- (instancetype)initWithUIModel:(id<UIModel>)model;

- (void)initialize;

///不同的子ViewModel会对应不同的view跟ViewParamsClass
///当前model对应的view
- (Class)ViewClass;
///当前model对应的viewParams,应用于view自身的属性
- (Class)ViewParamsClass;


@end

NS_ASSUME_NONNULL_END
