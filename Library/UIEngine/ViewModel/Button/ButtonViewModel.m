//
//  ButtonViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/10.
//

#import "ButtonViewModel.h"
#import "ButtonViewParams.h"

@interface ButtonViewModel()

@property (nonatomic, strong) Button *button;

@end

@implementation ButtonViewModel

- (void)initialize {
    self.button = (Button *)self.view;
    [self setButtonViewParams:(ButtonViewParams *)self.button.viewParams];
}

- (void)setButtonViewParams:(ButtonViewParams *)params {
    self.button.titleLabel.font = params.font;
    [self.button setTitle:params.text forState:UIControlStateNormal];
    [self.button setTitleColor:params.textColor forState:UIControlStateNormal];
    if (params.imageNormal) {
        [self.button setImage:params.imageNormal forState:UIControlStateNormal];
    }
    if (params.imageSelected) {
        [self.button setImage:params.imageSelected forState:UIControlStateSelected];
    }
}

- (Class)ViewClass {
    return [Button class];
}
- (Class)ViewParamsClass {
    return [ButtonViewParams class];
}

@end
