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
//    [self setButtonViewParams:(ButtonViewParams *)self.button.viewParams];
}

//- (void)setButtonViewParams:(ButtonViewParams *)params {
//    
////    self.button.selected = YES;
//}

- (Class)ViewClass {
    return [Button class];
}
- (Class)ViewParamsClass {
    return [ButtonViewParams class];
}

@end
