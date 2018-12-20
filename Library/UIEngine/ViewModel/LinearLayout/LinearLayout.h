//
//  LinearLayout.h
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewGroup.h"
#import "LinearLayoutViewParams.h"
#import "LinearLayoutParams.h"


NS_ASSUME_NONNULL_BEGIN

@interface LinearLayout : ViewGroup

//线性布局的方向
@property (nonatomic, assign) LinearLayoutOrientation orientation;

@end

NS_ASSUME_NONNULL_END
