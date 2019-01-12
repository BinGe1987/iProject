//
//  SearchViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchViewHandler.h"

@implementation SearchViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    [self clearButton];
    [self showHistory];
    return self;
}

- (void)clearButton {
    WeakSelf(self)
    UIButton *button = [self.view findViewByName:@"btn_clear"];
    [button setClickBlock:^(UIButton * _Nonnull button) {
        [Store setValue:@[] forKey:@"search_history"];
        [weakself showHistory];
    }];
}

- (void)refreshHistoryList {
    [self showHistory];
}

- (void)showHistory {
    WeakSelf(self)
    ScrollView *scrollView = [self.view findViewByName:@"history_list"];
    for (UIView *view in scrollView.subviews) {
        [view removeFromSuperview];
    }
    NSArray *array = [Store valueForKey:@"search_history"];
    if (array && array.count > 0) {
        for (NSString *value in array) {
            UIView *view = [UIView viewWithXML:@"SearchHistoryItem.xml"];
            [scrollView addView:view];
            
            UILabel *label = [view findViewByName:@"label_history"];
            label.text = value;
            
            
            UIButton *btn = [view findViewByName:@"btn_item"];
            [btn setClickBlock:^(UIButton * _Nonnull button) {
                [weakself.delegate onViewAction:@"action_search_text" data:value];
                [[button currentViewController].navigationView endEditing:YES];
            }];
        }
        
    }
    [scrollView boundsAndRefreshLayout];
    
}



@end
