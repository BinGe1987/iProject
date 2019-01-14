//
//  PublicCommentViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "PublicCommentViewHandler.h"
#import "PublicCommentTechListCell.h"

@interface PublicCommentViewHandler()<UITextViewDelegate, ImagePickerControllerDelegate>

@property (nonatomic, strong) ImagePickerController *picker;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) PhotoBrowser *browser;
@property (nonatomic, strong) UITableView *techTable;
@property (nonatomic, strong) TableViewSection *section;
@property (nonatomic, copy) NSString *text;

@end

@implementation PublicCommentViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    [self setTechNumberInput];
    [self setCommentLevel:5];
    [self setSuggestion];
    [self imagePicker];
    
    return self;
}
 
#pragma mask 选择技师
- (void)setTechNumberInput {
    self.techTable = [self.view findViewByName:@"table_tech"];
    self.techTable.layer.masksToBounds = YES;
    self.section = [TableViewSection sectionWithCell:[PublicCommentTechListCell class] height:ScaleValue(42) dataArray:@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",]];
    
    [self.techTable setAdapter:[TableViewAdapter AdapterWithSourceData:[@[self.section] mutableCopy]]];
    
    UITextField *input = [self.view findViewByName:@"input_tech"];
    [input addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [input addTarget:self action:@selector(textFieldEnd:) forControlEvents:UIControlEventEditingDidEnd];
}
- (void)textFieldChanged:(UITextField*)textField {
    NSString *string = textField.text;
    self.text = string;
    [self performSelector:@selector(startSearch:) withObject:string afterDelay:0.6];
}
- (void)startSearch:(NSString *)string {
    if ([string isEqualToString:self.text]) {
        NSLog(@"开始搜索 %@",string);
        [self.delegate onViewAction:@"action_search" data:string];
        NSInteger count = [string length] > 4 ? 4 :[string length];
        WeakSelf(self)
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = weakself.techTable.frame;
            frame.size.height = count * ScaleValue(42)-1;
            weakself.techTable.frame = frame;
        } completion:^(BOOL finished) {
        }];
    }
}
- (void)textFieldEnd:(UITextField*)textField {
    WeakSelf(self)
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = weakself.techTable.frame;
        frame.size.height = 0;
        weakself.techTable.frame = frame;
    } completion:^(BOOL finished) {
    }];
}
- (void)reloadTechList {
//    [self.techTable reloadData];
}



#pragma mask 选择表情
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

#pragma mask 意见输入
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
#pragma mask 图片选择
- (void)imagePicker {
    self.images = [NSMutableArray new];
    UIButton *btn = [self.view findViewByName:@"btn_image_picker"];
    WeakSelf(self)
    [btn setClickBlock:^(UIButton * _Nonnull button) {
        if (!weakself.picker) {
            weakself.picker = [ImagePickerController new];
        }
        [weakself.picker imagePickerMaxCount:(4-weakself.images.count) delegate:self];
    }];
    [self showImages];
}
- (void)pickController:(id)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos {
    [self.images addObjectsFromArray:photos];
    [self showImages];
    
}
- (void)showImages {
    ViewGroup *uploadButton = [self.view findViewByName:@"layout_upload_button"];
    if (self.images.count >= 4) {
        [uploadButton setViewVisibility:ViewVisibilityInvisible];
    } else {
        [uploadButton setViewVisibility:ViewVisibilityVisible];
    }
    for (NSInteger i=3; i>=0; i--) {
        NSString *name = [NSString stringWithFormat:@"image%ld", i+1];
        ViewGroup *vg = [self.view findViewByName:name];
        UIButton *imageButton = [vg findViewByName:@"image"];
        imageButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        if (self.images.count > i) {
            [vg setViewVisibility:ViewVisibilityVisible];
            UIImage *image = self.images[i];
            [imageButton setImage:image forState:UIControlStateNormal];
            
            WeakSelf(self)
            [imageButton setClickBlock:^(UIButton * _Nonnull button) {
                if (!weakself.browser) {
                    weakself.browser = [PhotoBrowser new];
                }
                [weakself.browser browserPhotoItems:@[[[PhotoItem alloc] initWithView:button image:image]] selectedIndex:0];
            }];
            
            UIButton *close = [vg findViewByName:@"btn_close"];
            [close setClickBlock:^(UIButton * _Nonnull button) {
                [weakself.images removeObject:image];
                [weakself showImages];
            }];
        } else {
            [vg setViewVisibility:ViewVisibilityGone];
            uploadButton.layoutParams = vg.layoutParams;

        }
    }
    ViewGroup *vg = [self.view findViewByName:@"layout_upload"];
    [vg boundsAndRefreshLayout];
}

@end
