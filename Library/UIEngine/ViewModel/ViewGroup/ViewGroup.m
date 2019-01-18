//
//  ViewGroup.m
//  UIEngine
//
//  Created by BinGe on 2018/11/28.
//  Copyright © 2018 Bin. All rights reserved.
//

#import "ViewGroup.h"

@implementation ViewGroup

- (void)addView:(UIView *)view {
    [self addSubview:view];
}

- (void)removeView:(UIView *)view {
    [view removeFromSuperview];
}

- (void)assignmentForMaxSize:(CGSize)size {
    [super assignmentForMaxSize:size];
    
    CGFloat paddingLeft = self.viewParams.paddingLeft;
    CGFloat paddingRight = self.viewParams.paddingRight;
    CGFloat paddingTop = self.viewParams.paddingTop;
    CGFloat paddingBottom = self.viewParams.paddingBottom;
    
    for (UIView *view in self.subviews) {
        LayoutParams *lp = view.layoutParams;
        CGFloat maxWidth = self.maxWidth - lp.marginLeft - lp.marginRight;
        CGFloat maxHeight = self.maxHeight - lp.marginTop - lp.marginBottom;
        [view assignmentForMaxSize:CGSizeMake(maxWidth - (paddingLeft + paddingRight),
                                              maxHeight - (paddingTop + paddingBottom))];
    }
}

- (void)boundsAndRefreshLayout {
    [self layoutWithMaxWidth:self.maxWidth maxHeight:self.maxHeight completed:nil];
}

- (void)layoutWithMaxWidth:(CGFloat)width maxHeight:(CGFloat)height {
    [self layoutWithMaxWidth:width maxHeight:height completed:nil];
}

- (void)layoutWithMaxWidth:(CGFloat)width maxHeight:(CGFloat)height completed:(void(^)(void))block {
    self.frame = CGRectMake(0, 0, width, height);
    [self assignmentForMaxSize:CGSizeMake(width, height)];
    [self boundingSize];
    [self refreshLayout];
    if (block) {
        block();
    }
}

- (void)refreshLayout {
    TICK
    [self layoutWithSuperView:self];
    TOCK
}

- (void)layoutWithSuperView:(UIView *)superView {
    for (UIView *sub in superView.subviews) {
        if ([sub conformsToProtocol:@protocol(ViewGroupDelegate)]) {
            [self layoutWithSuperView:sub];
        }
    }
    if (!(superView.viewParams.visibility == ViewVisibilityGone)) {
        if ([superView conformsToProtocol:@protocol(ViewGroupDelegate)]) {
            id<ViewGroupDelegate> delegate = (id<ViewGroupDelegate>)superView;
//            TICK
            [delegate onLayout];
//            TOCK
//            Log(@"%@", [delegate class]);
        }
    }
}

- (void)onLayout {
    for (UIView *subView in self.subviews) {
        CGRect r = subView.frame;
        r.size.width =  self.width;
        r.size.height = self.height;
        subView.frame = r;
        
    }
}

@end
