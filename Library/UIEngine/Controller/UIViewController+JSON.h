//
//  UIViewController+JSON.h
//  UIEngine
//
//  Created by BinGe on 2018/11/26.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "UIViewController+ContentView.h"


NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JSON)

///用一个本地json的文件路径生成界面
- (void)setContentViewWithJSONPath:(NSString *)path;


@end

NS_ASSUME_NONNULL_END
