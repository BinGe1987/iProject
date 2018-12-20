//
//  UIButton+OnClick.h
//  APP
//
//  Created by BinGe on 2018/12/11.
//



NS_ASSUME_NONNULL_BEGIN

typedef void (^onClickBlock)(UIButton *button);

@interface UIButton (OnClick)

///点击事情
@property (nonatomic, assign) onClickBlock clickBlock;

@end

NS_ASSUME_NONNULL_END
