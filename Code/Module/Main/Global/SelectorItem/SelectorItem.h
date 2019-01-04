//
//  SelectorItem.h
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "FrameLayout.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^onItemClickBlock)(id target);

@interface SelectorItem : FrameLayout

///点击事情
@property (nonatomic, assign) onItemClickBlock itemClickBlock;

@end

NS_ASSUME_NONNULL_END
