//
//  TableViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "TableViewModel.h"

@implementation TableViewModel

- (void)initialize {
    ScrollView *scrollView = (ScrollView *)self.view;
    ScrollViewParams *params = (ScrollViewParams *)scrollView.viewParams;
    scrollView.showsVerticalScrollIndicator = params.scrollIndicator;
    scrollView.showsHorizontalScrollIndicator = params.scrollIndicator;
}


- (Class)ViewClass {
    return [TableView class];
}
- (Class)ViewParamsClass {
    return [TableViewParams class];
}

- (Class)LayoutParamsClass {
    return [TableLayoutParams class];
}

@end
