//
//  Presenter.h
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "BasePresenter.h"
#import "ViewHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface Presenter : BasePresenter

@property (nonatomic, strong) ViewHandler *handler;

- (instancetype)initWithView:(UIView *)view;

- (void)willAppear:(BOOL)animated;

- (void)didAppear:(BOOL)animated;

- (void)willDisappear:(BOOL)animated;

- (void)didDisappear:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
