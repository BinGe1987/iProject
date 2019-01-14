//
//  TextView.h
//  UIEngine
//
//  Created by BinGe on 2018/11/29.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "UIView+View.h"

NS_ASSUME_NONNULL_BEGIN

@interface TextView : UITextView

- (void)setPlaceholder:(NSString *)text;

- (void)setPlaceholderColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
