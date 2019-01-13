//
//  UIViewController+ContentView.m
//  APP
//
//  Created by BinGe on 2018/12/17.
//

#import "UIViewController+ContentView.h"
#import "RootView.h"

static const void *contentViewKey = &contentViewKey;

@implementation UIViewController (ContentView)

-(void)setContentView:(UIView *)contentView {
    objc_setAssociatedObject(self, contentViewKey, contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    RootView *root = [[RootView alloc] init];
    self.view = root;
    
    [self.view addSubview: contentView];
    self.view.backgroundColor = contentView.backgroundColor;
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
    UIView *view = self.view;
    UIEdgeInsets insets = view.safeAreaInsets;
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
}

@end
