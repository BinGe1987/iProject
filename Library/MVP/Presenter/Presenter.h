//
//  Presenter.h
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "BasePresenter.h"
#import "ViewHandler.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PresenterDelegate <NSObject>

- (void)onPresenterEvent:(id)event;

@end

@interface Presenter : BasePresenter

@property (nonatomic, assign) id<PresenterDelegate> delegate;

@property (nonatomic, strong) ViewHandler *handler;

- (instancetype)initWithView:(UIView *)view;

- (void)willAppear;

- (void)didAppear;

- (void)willDisappear;

- (void)didDisappear;


@end

NS_ASSUME_NONNULL_END
