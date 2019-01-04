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
    [self.button setTitleColor:params.textColorSelected forState:UIControlStateSelected];
    if (params.imageNormal) {
        [self.button setImage:params.imageNormal forState:UIControlStateNormal];
    }
    if (params.imageSelected) {
        [self.button setImage:params.imageSelected forState:UIControlStateSelected];
    }
    
    if (params.backgroundSelected) {
        self.button.backgroundColor = [UIColor whiteColor];
        
        [self.button setBackgroundImage:[ImageUtils imageWithColorHex:params.background size:CGSizeMake(10, 10)] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[ImageUtils imageWithColorHex:params.backgroundSelected size:CGSizeMake(10, 10)] forState:UIControlStateSelected];
        [self.button setBackgroundImage:[ImageUtils imageWithColorHex:params.backgroundSelected size:CGSizeMake(10, 10)] forState:UIControlStateHighlighted];
    }
//    self.button.selected = YES;
}

- (Class)ViewClass {
    return [Button class];
}
- (Class)ViewParamsClass {
    return [ButtonViewParams class];
}

@end
