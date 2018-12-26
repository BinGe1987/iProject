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
    [self requestLayout];
}

- (void)removeView:(UIView *)view {
    [view removeFromSuperview];
    [self requestLayout];
}

- (void)assignmentForMaxSize:(CGSize)size {
    [super assignmentForMaxSize:size];
    for (UIView *view in self.subviews) {
        [view assignmentForMaxSize:CGSizeMake(self.maxWidth, self.maxHeight)];
    }
}

//- (void)assignmentForMaxWidth:(CGFloat)width maxHeight:(CGFloat)height {
//    [super assignmentForMaxWidth:width maxHeight:height];
//    for (UIView *view in self.subviews) {
//        [view assignmentForMaxWidth:self.maxWidth maxHeight:self.maxHeight];
//    }
//}


- (void)layoutWithMaxWidth:(CGFloat)width maxHeight:(CGFloat)height completed:(void(^)(void))block {
//    WeakSelf(self)
//    dispatch_async(dispatch_get_global_queue(0,0),^{
//        ///初始化所有view的最大宽高
//        [weakself assignmentForMaxWidth:width maxHeight:height];
//        ///计算所有view的实际宽高
//        [weakself boundingSize];
//        dispatch_async(dispatch_get_main_queue(),^{
//            ///开始布局
//            [weakself refreshLayout];
//            block();
//        });
//    });
    
//    [self assignmentForMaxWidth:width maxHeight:height];
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
