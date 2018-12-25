//
//  ViewHandler.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewHandlerDelegate <NSObject>

- (void)onViewAction:(id)action;

@end

@interface ViewHandler : NSObject

@property (nonatomic, assign) id<ViewHandlerDelegate> delegate;

@property (nonatomic, strong) UIView *view;

- (instancetype)initWithView:(UIView *)view;

- (void)setData:(id)data;

@end

NS_ASSUME_NONNULL_END
