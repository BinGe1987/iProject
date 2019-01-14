//
//  PublicCommentViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "PublicCommentViewHandler.h"

@interface PublicCommentViewHandler()<UITextViewDelegate>

@end

@implementation PublicCommentViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    
    [self setCommentLevel:5];
    [self setSuggestion];
    
    return self;
}

//选择表情
- (void)setCommentLevel:(NSInteger)level {
    
    for (NSInteger i=1; i<=5; i++) {
        NSString *name = [NSString stringWithFormat:@"comment_level%ld", i];
        ViewGroup *vg = [self.view findViewByName:name];
        UIButton *button = [vg findViewByName:@"image"];
        button.tag = i;
        UIButton *label = [vg findViewByName:@"label"];
        if (level == i) {
            button.selected = YES;
            label.selected = YES;
        } else {
            button.selected = NO;
            label.selected = NO;
        }
        WeakSelf(self)
        [button setClickBlock:^(UIButton * _Nonnull button) {
            [weakself setCommentLevel:button.tag];
            [weakself.view endEditing:YES];
        }];
    }
    
    
}

//意见输入
- (void)setSuggestion {
    UITextView *textView = [self.view findViewByName:@"input_suggestion"];
    textView.delegate = self;
}
- (void)textViewDidChange:(UITextView *)textView {
    //处理中文时算上了拼间或笔画字数
    UITextRange *selectedRange = [textView markedTextRange];
    if([textView textInRange:selectedRange].length>0) return;
    
    UITextView *label = [self.view findViewByName:@"label_suggestion_count"];
    label.text = [textView.text length] >= 15 ? nil : [NSString stringWithFormat:@"加油，还差%ld个字！", 15-textView.text.length];
}

- (void)setUploadLayout {
//    ViewGroup *vg = [self.view findViewByName:@"layout_upload"];
    
}

@end
