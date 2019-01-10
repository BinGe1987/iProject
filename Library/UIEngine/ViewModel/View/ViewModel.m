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
        self.view = [[[self ViewClass] alloc] initWithViewParams:[[[self ViewParamsClass] alloc] initWithModel:model]];
        [self initialize];
    }
    return self;
}

- (void)setupViewParams:(ViewParams *)viewParams {
    self.view.alpha = viewParams.alpha;
    [self.view setVisibility:viewParams.visibility];
    NSString *background = viewParams.background;
    if (background) {
        if ([background hasPrefix:@"#"]) {
            self.view.backgroundColor = [ColorUtils colorWithString:background];
        }
        else if ([background hasPrefix:@"@"]) {
            background = [background substringFromIndex:1];
            UIImage *image = [UIImage imageNamed:background];
            self.view.layer.contents = (id)image.CGImage;
        }
    }
    
    self.view.layer.masksToBounds = viewParams.masksToBounds;
    self.view.layer.borderColor = viewParams.borderColor.CGColor;
    if (viewParams.borderWidth) {
        self.view.layer.borderWidth = viewParams.borderWidth;
    }
    if (viewParams.borderRadius) {
        self.view.layer.cornerRadius = viewParams.borderRadius;
    }
    
    if (viewParams.shadowColor) {
        self.view.layer.shadowColor = viewParams.shadowColor.CGColor;
        self.view.layer.shadowOffset = CGSizeMake(viewParams.shadowOffsetX, viewParams.shadowOffsetY);
        self.view.layer.shadowRadius = viewParams.shadowRadius;
        self.view.layer.shadowOpacity = viewParams.shadowOpacity;
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
