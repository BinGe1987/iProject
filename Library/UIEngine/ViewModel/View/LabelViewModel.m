//
//  LabelViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "LabelViewModel.h"


@interface LabelViewModel()

@property (nonatomic, strong) LabelView *textView;

@end

@implementation LabelViewModel

- (void)initialize {
    self.textView = (LabelView *)self.view;
    [self setTextViewParams:(LabelViewParams *)self.textView.viewParams];
}

- (void)setTextViewParams:(LabelViewParams *)params {
    self.textView.font = params.font;
    self.textView.text = params.text;
    self.textView.textColor = params.textColor;
}

- (Class)ViewClass {
    return [LabelView class];
}
- (Class)ViewParamsClass {
    return [LabelViewParams class];
}

@end
