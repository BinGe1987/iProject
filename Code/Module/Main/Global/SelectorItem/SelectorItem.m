//
//  SelectorItem.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "SelectorItem.h"

@implementation SelectorItem

- (instancetype)initWithViewParams:(ViewParams *)viewParams {
    self = [super initWithViewParams:viewParams];
    UIView *view = [UIView viewWithXML:@"SelectorItem.xml" size:[self boundingSize]];
    [self addSubview:view];
    
    ViewParams *vp = self.viewParams;
    
    UILabel *label = (UILabel *)[view findViewByName:@"left_text"];
    NSString *leftText = [vp paramWithKey:@"selector_leftText"];
    label.text = leftText;
    
    label = (UILabel *)[view findViewByName:@"right_text"];
    NSString *rightText = [vp paramWithKey:@"selector_rightText"];
    label.text = rightText;
    
    NSString *arrow = [vp paramWithKey:@"selector_arrow"];
    if (![NSString isEmpty:arrow] && [arrow isEqualToString:@"NO"]) {
        [[view findViewByName:@"right_arrow"] setViewVisibility:ViewVisibilityGone];
    }
    
    UIButton *button = (UIButton *)[view findViewByName:@"button"];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (void)click {
    if (self.itemClickBlock) {
        self.itemClickBlock(self);
    }
}

@end
