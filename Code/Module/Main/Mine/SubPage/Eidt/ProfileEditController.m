//
//  ProfileEditController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "ProfileEditController.h"

@interface ProfileEditController () <UIActionSheetDelegate>

@end

@implementation ProfileEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    [self setContentViewWithXML:@"ProfileEditController.xml"];
    
//    WeakSelf(self)
    SelectorItem *imageItem = [self findViewByName:@"selector_head"];
    [imageItem setItemClickBlock:^(id  _Nonnull target) {
        ActionSheet *actionSheet = [ActionSheet new];
        [actionSheet addItem:@"拍照" block:^{
            NSLog(@"123");
        }];
        [actionSheet addItem:@"从手机相册中选择" block:^{
            NSLog(@"456");
        }];
        [actionSheet show];
    }];
    
    SelectorItem *genderItem = [self findViewByName:@"selector_gender"];
    [genderItem setItemClickBlock:^(id  _Nonnull target) {
        ActionSheet *actionSheet = [ActionSheet new];
        [actionSheet addItem:@"男" block:^{
            NSLog(@"男");
        }];
        [actionSheet addItem:@"女" block:^{
            NSLog(@"女");
        }];
        [actionSheet show];
    }];
}

@end
