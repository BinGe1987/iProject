//
//  PublicCommentViewHandler.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "PublicCommentViewHandler.h"
#import "PublicCommentTechListCell.h"

@interface PublicCommentViewHandler()<UITextViewDelegate, ImagePickerControllerDelegate, TableViewAdapterDelegate>

@property (nonatomic, strong) ImagePickerController *picker;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, strong) NSMutableArray *uploadImages;
@property (nonatomic, strong) NSMutableDictionary *uploadDatas;
@property (nonatomic, strong) PhotoBrowser *browser;
@property (nonatomic, strong) UITableView *techTable;
@property (nonatomic, strong) TableViewSection *section;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) NSMutableDictionary *params;
@property (nonatomic, strong) TechData *currentTech;

@end

@implementation PublicCommentViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.params = [NSMutableDictionary dictionaryWithObject:@"5" forKey:@"score"];
    UIViewController *vc = [view currentViewController];
    UIButton *public = [vc.navigationView findViewByName:@"btn_public"];
    WeakSelf(self)
    [public setClickBlock:^(UIButton * _Nonnull button) {
        [weakself public];
    }];
    
    if ([vc.intentData isKindOfClass:[ClubData class]]) {
        ClubData *club = vc.intentData;
        [self.params setObject:club.clubID forKey:@"clubId"];
        [self.params setObject:club.name forKey:@"clubName"];
        [self.params setObject:@"club" forKey:@"type"];
    } else {
        TechDetailData *detail = vc.intentData;
        self.currentTech = detail.techData;
        [self.params setObject:detail.clubData.clubID forKey:@"clubId"];
        [self.params setObject:detail.clubData.name forKey:@"clubName"];
        [self.params setObject:@"tech" forKey:@"type"];
        
        
    }
    
    [self setTechNumberInput];
    [self setCommentLevel:5];
    [self setSuggestion];
    [self imagePicker];
    
    return self;
}

- (void)public {
    NSString *content = self.params[@"content"];
    if ([content length] < 15) {
        [ProgressHUB showTips:@"评论内容需满15个字哦～"];
        return;
    }
    NSMutableString *urls = [NSMutableString new];
    for (Data *data in [self.uploadDatas allValues]) {
        Data *respData = [data dataWithKey:@"respData"];
        NSString *url = [respData stringWithKey:@"url"];
        
        [urls appendString:url];
        [urls appendString:@","];
    }
    if ([urls hasSuffix:@","]) {
        [urls deleteCharactersInRange:NSMakeRange(urls.length-1, 1)];
    }
    NSLog(@"urls : %@", urls);
    [self.params setObject:urls forKey:@"imgList"];
    
    if (self.currentTech) {
        [self.params setObject:self.currentTech.techID forKey:@"techId"];
        [self.params setObject:self.currentTech.name forKey:@"techName"];
        [self.params setObject:self.currentTech.number forKey:@"serialNo"];
    } else {
        [self.params setObject:@"0" forKey:@"techId"];
        [self.params setObject:@"" forKey:@"techName"];
        [self.params setObject:@"" forKey:@"serialNo"];
    }
    
    [self.delegate onViewAction:@"action_public" data:self.params];
}

- (void)publicFinish:(Data *)data {
    if ([data isSuccess]) {
        [self.view popControllerAnimated:YES];
        [ProgressHUB toast:@"发布成功"];
    } else {
        NSString *info =[NSString stringWithFormat:@"%@(%@)",[data stringWithKey:@"msg"],[data stringWithKey:@"statusCode"]] ;
        [ProgressHUB showTips:info];
    }
}

#pragma mask 选择技师
- (void)setTechNumberInput {
    
    UIViewController *vc = [self.view currentViewController];
    
    UITextField *input = [self.view findViewByName:@"input_tech"];
    //如果是技师，隐藏技师输入框
    if ([vc.intentData isKindOfClass:[TechData class]]) {
        [input setViewVisibility:ViewVisibilityGone];
        ViewGroup *scroll = [self.view findViewByName:@"scroll"];
        [scroll boundsAndRefreshLayout];
        return;
    }
    
    [input addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    [input addTarget:self action:@selector(textFieldEnd:) forControlEvents:UIControlEventEditingDidEnd];
    
    self.techTable = [self.view findViewByName:@"table_tech"];
    self.techTable.layer.masksToBounds = YES;
    self.section = [TableViewSection sectionWithCell:[PublicCommentTechListCell class] height:ScaleValue(42) dataArray:@[]];
    TableViewAdapter *adapter = [TableViewAdapter AdapterWithSourceData:[@[self.section] mutableCopy]];
    adapter.delegate = self;
    [self.techTable setAdapter:adapter];
}
- (void)textFieldChanged:(UITextField*)textField {
    NSString *string = textField.text;
    if (self.currentTech) {
        TechData *tech = self.currentTech;
        NSString *text = [NSString stringWithFormat:@"%@ (%@)",tech.name?tech.name:@"", tech.number];
        if ([string length] > [self.text length]) { //++
            string = [string stringByReplacingOccurrencesOfString:text withString:@""];
            textField.text = string;
        } else {
            string = @"";
            textField.text = string;
        }
        self.currentTech = nil;
    }
    self.text = string;
    if ([NSString isEmpty:string]) {
        [self setTechList:[ListData new]];
    } else {
        [self performSelector:@selector(startSearch:) withObject:string afterDelay:0.6];
    }
    
    
}
- (void)startSearch:(NSString *)string {
    if ([string isEqualToString:self.text]) {
        NSLog(@"开始搜索 %@",string);
        [self.delegate onViewAction:@"action_search" data:string];
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
- (void)setTechList:(ListData *)listData {
    NSInteger old = self.section.array.count;
    self.section.array = [listData.list mutableCopy];
    NSInteger count = self.section.array.count > 4 ? 4 : self.section.array.count;
    if (old < count) {
        [self.techTable reloadData];
    }
    WeakSelf(self)
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = weakself.techTable.frame;
        frame.size.height = count * ScaleValue(42);
        weakself.techTable.frame = frame;
    } completion:^(BOOL finished) {
        [weakself.techTable reloadData];
    }];
}
- (void)adapter:(TableViewAdapter *)adapter didCellSelected:(TableViewCell *)cell {
    TechData *tech = cell.data;
    UITextField *input = [self.view findViewByName:@"input_tech"];
    input.text = [NSString stringWithFormat:@"%@ (%@)",tech.name?tech.name:@"", tech.number];
    [self setTechList:[ListData new]];
    [self.view endEditing:YES];
    
    self.text = input.text;
    self.currentTech = tech;
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
            
            [weakself.params setObject:@(i) forKey:@"score"];
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
    
    [self.params setObject:textView.text forKey:@"content"];
    
}
#pragma mask 图片选择
- (void)imagePicker {
    self.images = [NSMutableArray new];
    self.uploadImages = [NSMutableArray new];
    self.uploadDatas = [NSMutableDictionary new];
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
    [self.delegate onViewAction:@"action_upload" data:photos];
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
        UIActivityIndicatorView *indicator = [imageButton viewWithTag:99];
        if (!indicator) {
            indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
            indicator.tag = 99;
            indicator.hidesWhenStopped = YES;
            indicator.backgroundColor = [ColorUtils colorWithString:@"#88ffffff"];
            indicator.color = [UIColor blackColor];
            [imageButton addSubview:indicator];
        }
    
        imageButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        if (self.images.count > i) {
            [vg setViewVisibility:ViewVisibilityVisible];
            UIImage *image = self.images[i];
            [imageButton setImage:image forState:UIControlStateNormal];
            if (![self.uploadImages containsObject:image]) {
                indicator.frame = CGRectMake(0, 0, imageButton.width, imageButton.height);
                [indicator startAnimating];
            }
            
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
                [weakself.uploadImages removeObject:image];
                [weakself.uploadDatas removeObjectForKey:[image description]];
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

- (void)uploadResponse:(Data *)data {
    UIImage *image = data.source[@"image"];
    for (NSInteger i=3; i>=0; i--) {
        NSString *name = [NSString stringWithFormat:@"image%ld", i+1];
        ViewGroup *vg = [self.view findViewByName:name];
        UIButton *imageButton = [vg findViewByName:@"image"];
        UIActivityIndicatorView *indicator = [imageButton viewWithTag:99];
        UIImage *buttonImage = imageButton.imageView.image;
        if (buttonImage == image) {
            [indicator stopAnimating];
            if ([data isSuccess]) {
                if ([self.images containsObject:image]) {
                    [self.uploadImages addObject:image];
                    [self.uploadDatas setObject:data forKey:[image description]];
                }
            } else {
                [ProgressHUB showTips:@"图片上传失败"];
                [self.images removeObject:image];
                [self showImages];
            }
        }
    }
}

@end
