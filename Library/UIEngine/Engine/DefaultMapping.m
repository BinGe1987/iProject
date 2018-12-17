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
#import "TextViewModel.h"
#import "ButtonViewModel.h"
#import "FrameViewModel.h"
#import "ScrollViewModel.h"


@implementation DefaultMapping

- (ViewModel *) getViewModel:(id<UIModel>)model {
    
    NSString *type = [model getType];
    if (!type) {
        
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
    else if ([type isEqualToString:@"text"]) {
        return [[TextViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"image"]) {
        return [[ImageViewModel alloc] initWithUIModel:model];
    }
    else if ([type isEqualToString:@"button"]) {
        return [[ButtonViewModel alloc] initWithUIModel:model];
    }
    return [[TextViewModel alloc] initWithUIModel:model];
}

@end
