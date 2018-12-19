//
//  TableViewModel.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "TableViewModel.h"

@implementation TableViewModel

- (void)initialize {
    
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
