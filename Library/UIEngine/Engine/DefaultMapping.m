//
//  DefaultMapping.m
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "DefaultMapping.h"
#import "LinearViewModel.h"
#import "ImageViewModel.h"
#import "LabelViewModel.h"
#import "TextViewModel.h"
#import "InputViewModel.h"
#import "ButtonViewModel.h"
#import "FrameViewModel.h"
#import "ScrollViewModel.h"
#import "TableViewModel.h"
#import "ViewPagerModel.h"


@implementation DefaultMapping

- (ViewModel *) getViewModel:(id<UIModel>)model {
    
    NSString *type = [model getType];
    if (!type) {
        return nil;
    }
    else if ([type isEqualToString:@"view"]) {
        return [[ViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"frame"]) {
        return [[FrameViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"linear"]) {
        return [[LinearViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"scroll"]) {
        return [[ScrollViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"table"]) {
        return [[TableViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"label"]) {
        return [[LabelViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"text"]) {
        return [[TextViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"input"]) {
        return [[InputViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"image"]) {
        return [[ImageViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"button"]) {
        return [[ButtonViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"pager"]) {
        return [[ViewPagerModel alloc] initWithUIModel:model];
    }
    return [[ViewModel alloc] initWithUIModel:model];
}

@end
