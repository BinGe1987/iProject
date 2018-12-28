//
//  ViewModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewModel.h"

@interface ViewModel()

@end

@implementation ViewModel

- (instancetype)initWithUIModel:(id<UIModel>)model {
    self = [super init];
    if (self) {
        self.model = model;
        self.view = [[[self ViewClass] alloc] init];
        self.view.viewParams = [[[self ViewParamsClass] alloc] initWithModel:model];
        [self setupViewParams:self.view.viewParams];
        [self initialize];
    }
    return self;
}

- (void)setupViewParams:(ViewParams *)viewParams {
    ///设置view的透明度
    self.view.alpha = viewParams.alpha;
    
    [self.view setVisibility:viewParams.visibility];
    
    ///设置view的背景
    NSString *background = viewParams.background;
    if (background) {
        if ([background hasPrefix:@"#"]) {
            self.view.backgroundColor = [ColorUtils colorWithString:background];
        }
    }
    
    self.view.layer.borderColor = viewParams.borderColor.CGColor;
    if (viewParams.borderWidth) {
        self.view.layer.borderWidth = viewParams.borderWidth;
    }
    if (viewParams.borderRadius) {
        self.view.layer.cornerRadius = viewParams.borderRadius;
        self.view.layer.masksToBounds = YES;
    }
}

- (void)initialize {
//    NSLog(@"ViewModel 初始化！");
}

- (Class)ViewClass {
    return [UIView class];
}

- (Class)ViewParamsClass {
    return [ViewParams class];
}

@end
