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
#import "CollectionViewModel.h"
#import "CustomViewModel.h"
#import "NavigationViewModel.h"


@implementation DefaultMapping

- (ViewModel *) getViewModel:(id<UIModel>)model {
    
    NSString *type = [model getType];
    if (!type) {
        return nil;
    }
    else if ([type isEqualToString:@"View"] || [type isEqualToString:@"view"]) {
        return [[ViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"FrameLayout"] || [type isEqualToString:@"frame"]) {
        return [[FrameViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"LinearLayout"] || [type isEqualToString:@"linear"]) {
        return [[LinearViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"ScrollView"] || [type isEqualToString:@"scroll"]) {
        return [[ScrollViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"TableView"] || [type isEqualToString:@"table"]) {
        return [[TableViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"Label"] || [type isEqualToString:@"label"]) {
        return [[LabelViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"TextView"] || [type isEqualToString:@"text"]) {
        return [[TextViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"InputView"] || [type isEqualToString:@"input"]) {
        return [[InputViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"ImageView"] || [type isEqualToString:@"image"]) {
        return [[ImageViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"Button"] || [type isEqualToString:@"button"]) {
        return [[ButtonViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"ViewPager"] || [type isEqualToString:@"pager"]) {
        return [[ViewPagerModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"CollectionView"] || [type isEqualToString:@"collection"]) {
        return [[CollectionViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"CustomView"] || [type isEqualToString:@"custom"]) {
        return [[CustomViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"Navigation"] || [type isEqualToString:@"navigation"]) {
        return [[NavigationViewModel alloc] initWithUIModel:model];
    }
    return [[ViewModel alloc] initWithUIModel:model];
}

@end
