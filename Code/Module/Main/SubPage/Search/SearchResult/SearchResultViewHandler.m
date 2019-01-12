//
//  SearchResultViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchResultViewHandler.h"

@implementation SearchResultViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    return self;
}

- (void)setData:(id)data {
    if ([NSString isEmpty:data]) {
        [self.view setViewVisibility:ViewVisibilityInvisible];
    } else {
        [self.view setViewVisibility:ViewVisibilityVisible];
    }
}

@end
