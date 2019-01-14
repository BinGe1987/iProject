//
//  PublicCommentPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "PublicCommentPresenter.h"
#import "PublicCommentViewHandler.h"

@implementation PublicCommentPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];

    self.handler = [[PublicCommentViewHandler alloc] initWithView:view];
    
    return self;
}

@end
