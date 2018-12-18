//
//  UIViewController+ContentView.m
//  APP
//
//  Created by BinGe on 2018/12/17.
//

#import "UIViewController+ContentView.h"

static const void *contentViewKey = &contentViewKey;

@implementation UIViewController (ContentView)

-(void)setContentView:(UIView *)contentView {
    objc_setAssociatedObject(self, contentViewKey, contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    FrameLayout *vg = [[FrameLayout alloc] init];
    ViewParams *vp = [[ViewParams alloc] init];
    vp.width = FULL;
    vp.height = FULL;
    vg.viewParams = vp;
    
    [vg addSubview:contentView];
    self.view = vg;
    self.view.backgroundColor = self.contentView.backgroundColor;
    
    [self addRefreshLayoutRunLoop];
}

- (ViewGroup *)contentView {
    return objc_getAssociatedObject(self, contentViewKey);
}

- (void)viewSafeAreaInsetsDidChange {
    [self refreshLayout];
}

- (UIView *)findViewByName:(NSString *)name {
    return [self.view findViewByName:name];
}

- (void)dealloc
{
    [self removeRefreshLayoutRunLoop];
}

@end
