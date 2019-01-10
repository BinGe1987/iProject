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

static const void *safeAreaKey = &safeAreaKey;
- (void)setSafeAreaString:(NSString *)areaString {
    objc_setAssociatedObject(self, &safeAreaKey, areaString, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)safeAreaString {
    return objc_getAssociatedObject(self, &safeAreaKey);
}

- (void)viewSafeAreaInsetsDidChange {
    UIEdgeInsets insets = self.view.safeAreaInsets;
    NSString *new = [NSString stringWithFormat:@"%.0f|%.00f|%.0f|%.0f",insets.left,insets.top,insets.right,insets.bottom];
    NSString *old = self.safeAreaString;
    if (new && old && [new isEqualToString:old]) {
        return;
    }
    self.safeAreaString = new;
    old = self.safeAreaString;
    [self refreshLayout];
}

- (id)findViewByName:(NSString *)name {
    return [self.view findViewByName:name];
}

- (void)dealloc
{
    [self removeRefreshLayoutRunLoop];
}

@end
