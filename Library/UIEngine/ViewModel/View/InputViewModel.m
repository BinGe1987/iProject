//
//  InputViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "InputViewModel.h"

@interface InputViewModel()

@property (nonatomic, strong) InputView *inputView;

@end

@implementation InputViewModel

- (void)initialize {
    self.inputView = (InputView *)self.view;
    [self setTextViewParams:(InputViewParams *)self.inputView.viewParams];
}

- (void)setTextViewParams:(InputViewParams *)params {
    self.inputView.font = params.font;
    self.inputView.text = params.text;
    self.inputView.textColor = params.textColor;
}

- (Class)ViewClass {
    return [InputView class];
}
- (Class)ViewParamsClass {
    return [InputViewParams class];
}

@end
