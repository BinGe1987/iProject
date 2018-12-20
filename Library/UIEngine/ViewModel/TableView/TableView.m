//
//  TableView.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "TableView.h"

@implementation TableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    return self;
}

@end
