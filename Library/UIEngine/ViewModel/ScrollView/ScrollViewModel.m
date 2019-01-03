//
//  ScrollViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/13.
//

#import "ScrollViewModel.h"

@implementation ScrollViewModel

- (void)initialize {
    ScrollView *scrollView = (ScrollView *)self.view;
    ScrollViewParams *params = (ScrollViewParams *)scrollView.viewParams;
    scrollView.orientation = params.orientation;
    
    scrollView.showsVerticalScrollIndicator = params.scrollIndicator;
    scrollView.showsHorizontalScrollIndicator = params.scrollIndicator;
}


- (Class)ViewClass {
    return [ScrollView class];
}
- (Class)ViewParamsClass {
    return [ScrollViewParams class];
}

- (Class)LayoutParamsClass {
    return [ScrollLayoutParams class];
}


@end
