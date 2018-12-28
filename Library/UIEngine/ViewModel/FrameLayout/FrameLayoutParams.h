//
//  FrameLayoutParams.h
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "LayoutParams.h"

typedef NS_OPTIONS(NSInteger, FrameLayoutGravity) {
    
    FrameLayoutGravityLeft      = 1 << 0,// 0000 0001
    FrameLayoutGravityTop       = 1 << 1,// 0000 0010
    FrameLayoutGravityRight     = 1 << 2,// 0000 0100
    FrameLayoutGravityBottom    = 1 << 3,// 0000 1000
    FrameLayoutGravityCenter    = 1 << 4 // 0001 0000
};

NS_ASSUME_NONNULL_BEGIN

@interface FrameLayoutParams : LayoutParams

@property (nonatomic, assign) FrameLayoutGravity gravity;

@end

NS_ASSUME_NONNULL_END
