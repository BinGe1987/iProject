//
//  ViewHandler.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewHandlerDelegate <NSObject>

- (void)onViewAction:(id)action data:(_Nullable id)data;

@end

@protocol IViewHandler <NSObject>

- (void)setDelegate:(id<ViewHandlerDelegate>)delegate;
- (void)setView:(UIView *)view;
- (id)view;
- (void)setData:(id)data;

@end

@interface ViewHandler : NSObject<IViewHandler>

@property (nonatomic, assign) id<ViewHandlerDelegate> delegate;

@property (nonatomic, strong) UIView *view;

+ (instancetype)handlerWithView:(UIView *)view;
+ (instancetype)handlerWithView:(UIView *)view delgate:(_Nullable id<ViewHandlerDelegate>)delgate;

- (instancetype)initWithView:(UIView *)view;

- (void)showNetworkActivityIndicatorVisible:(BOOL)visible;

@end

NS_ASSUME_NONNULL_END
