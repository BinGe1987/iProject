//
//  TextViewModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "TextViewModel.h"
#import "TextViewParams.h"

@interface TextViewModel()

@property (nonatomic, strong) TextView *textView;

@end

@implementation TextViewModel

- (void)initialize {
    self.textView = (TextView *)self.view;
    [self setTextViewParams:(TextViewParams *)self.textView.viewParams];
}

- (void)setTextViewParams:(TextViewParams *)params {
    self.textView.font = params.font;
    self.textView.text = params.text;
    self.textView.textColor = params.textColor;
}

- (Class)ViewClass {
    return [TextView class];
}
- (Class)ViewParamsClass {
    return [TextViewParams class];
}

@end
