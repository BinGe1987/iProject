//
//  ViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "ViewHandler.h"

@implementation ViewHandler

+ (instancetype)handlerWithView:(UIView *)view {
    return [[self class] handlerWithView:view delgate:nil];
}

+ (instancetype)handlerWithView:(UIView *)view delgate:(_Nullable id<ViewHandlerDelegate>)delgate {
    id<IViewHandler> handler = [[[self class] alloc] initWithView:view];
    [handler setDelegate:delgate];
    return handler;
}

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        self.view =view;
    }
    return self;
}

- (void)setData:(id)data {
    
}

- (void)showNetworkActivityIndicatorVisible:(BOOL)visible {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:visible];
}

@end
