//
//  ViewGroupModel.h
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewModel.h"
#import "ViewGroup.h"

NS_ASSUME_NONNULL_BEGIN

/**
 布局类view与model的关系层，主要处理view与子view的关系
 */
@interface ViewGroupModel : ViewModel

- (void)addChildViewModel:(ViewModel *)child;

- (void)onChildViewModelAdded:(ViewModel *)child NS_REQUIRES_SUPER;

///这个属性需要在父view添加子view的时候才知道，当前view的所对应的应该是哪个layoutParams
- (Class)LayoutParamsClass;

@end

NS_ASSUME_NONNULL_END
