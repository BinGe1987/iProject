//
//  LinearViewModel.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "LinearViewModel.h"

@interface LinearViewModel()

@property (nonatomic, strong) LinearLayout *linear;

@end

@implementation LinearViewModel

- (void)initialize {
    self.linear = (LinearLayout *)self.view;
    LinearLayoutViewParams *params = (LinearLayoutViewParams *)self.linear.viewParams;
    self.linear.orientation = params.orientation;
}


- (Class)ViewClass {
    return [LinearLayout class];
}
- (Class)ViewParamsClass {
    return [LinearLayoutViewParams class];
}

- (Class)LayoutParamsClass {
    return [LinearLayoutParams class];
}

@end
