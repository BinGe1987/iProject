//
//  UIViewController+Layout.m
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import "UIViewController+Layout.h"

@interface UIViewController()

@property (nonatomic, strong) CADisplayLink *displayLink;

@end

static const void *displayLinkKey = &displayLinkKey;

@implementation UIViewController (Layout)

- (void)addRefreshLayoutRunLoop {
    if (!self.displayLink) {
        ///需要使用弱引用targer，controller才会正常的执行dealloc方法。
        WeakProxy *weakProxy = [WeakProxy weakProxyForObject:self];
        self.displayLink = [CADisplayLink displayLinkWithTarget:weakProxy selector:@selector(layoutSubViews)];
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
}

- (void)removeRefreshLayoutRunLoop {
    if (self.displayLink) {
        [self.displayLink invalidate];
    }
}

- (void)refreshLayout {
    [self.view requestLayout];
    [self layoutSubViews];
}

- (void)layoutSubViews {
    if ([self.view isKindOfClass:[ViewGroup class]]) {
        ViewGroup *vg = (ViewGroup *)self.contentView;
        if (vg.isNeedRefrealLayout) {
            [vg refreshLayoutCompleted];
//            Log(@"refresh layout。");
            CGRect safeRect = self.safeRect;
            self.contentView.frame = safeRect;
            WeakSelf(self)
            [vg layoutWithMaxWidth:safeRect.size.width maxHeight:safeRect.size.height completed:^{
                [weakself onLayoutSubViewsCompleted];
            }];
        }
    }
}

- (void)onLayoutSubViewsCompleted {
    
}

- (CGRect)safeRect {
    return CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
}

- (void)setDisplayLink:(CADisplayLink *)link {
    objc_setAssociatedObject(self, displayLinkKey, link, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CADisplayLink *)displayLink {
    return objc_getAssociatedObject(self, displayLinkKey);
}


@end
