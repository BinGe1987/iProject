//
//  Presenter.h
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "BasePresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface Presenter : BasePresenter

@property (nonatomic, strong) UIView *view;

- (instancetype)initWithView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
