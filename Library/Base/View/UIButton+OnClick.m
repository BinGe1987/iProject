//
//  UIButton+OnClick.m
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import "UIButton+OnClick.h"

static const void *onClickBlockKey = &onClickBlockKey;

@implementation UIButton (OnClick)

- (void)setClickBlock:(onClickBlock)block {
    objc_setAssociatedObject(self, onClickBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
}

-(onClickBlock)clickBlock {
    return objc_getAssociatedObject(self, onClickBlockKey);
}

- (void)onClick {
    if (self.clickBlock) {
        self.clickBlock(self);
    }
}

@end
