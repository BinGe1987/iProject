//
//  ViewPagerModel.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "ViewPagerModel.h"

@implementation ViewPagerModel

- (void)initialize {
    ViewPager *scrollView = (ViewPager *)self.view;
    ViewPagerParams *params = (ViewPagerParams *)scrollView.viewParams;
    scrollView.orientation = params.orientation;
}


- (Class)ViewClass {
    return [ViewPager class];
}
- (Class)ViewParamsClass {
    return [ViewPagerParams class];
}

- (Class)LayoutParamsClass {
    return [ViewPagerLayoutParams class];
}


@end
