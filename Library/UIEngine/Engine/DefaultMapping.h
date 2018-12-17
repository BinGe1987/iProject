//
//  DefaultMapping.h
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IEngineMapping.h"

NS_ASSUME_NONNULL_BEGIN


/**
 mapping 的默认实现，引擎初始化时会加载这个默认mapping类
 */
@interface DefaultMapping : NSObject<IEngineMapping>

@end

NS_ASSUME_NONNULL_END
