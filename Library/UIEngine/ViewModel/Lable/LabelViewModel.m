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
    self.textView.textAlignment = NSTextAlignmentCenter;
    [self setTextViewParams:(LabelViewParams *)self.textView.viewParams];
}

- (void)setTextViewParams:(LabelViewParams *)params {
    self.textView.font = params.font;
    self.textView.text = params.text;
    self.textView.textColor = params.textColor;
    self.textView.numberOfLines = params.lines;
    
    if (params.textGravity & TextGravityCenter) {
        self.textView.textAlignment = NSTextAlignmentCenter;
    }
    if (params.textGravity & TextGravityLeft) {
        self.textView.textAlignment = NSTextAlignmentLeft;
    }
    else if (params.textGravity & TextGravityRight) {
        self.textView.textAlignment = NSTextAlignmentRight;
    }
    if (params.textGravity & TextGravityTop) {
        
    }
    else if (params.textGravity & TextGravityBottom) {
        
    }
    
}

- (Class)ViewClass {
    return [LabelView class];
}
- (Class)ViewParamsClass {
    return [LabelViewParams class];
}

@end
