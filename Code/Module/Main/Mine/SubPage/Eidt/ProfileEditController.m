//
//  ProfileEditController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "ProfileEditController.h"

@interface ProfileEditController () <UIActionSheetDelegate, ImagePickerControllerDelegate>

@property (nonatomic, strong) ImagePickerController *picker;

@end

@implementation ProfileEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    [self setContentViewWithXML:@"ProfileEditController.xml"];
    
    WeakSelf(self)
    SelectorItem *imageItem = [self findViewByName:@"selector_head"];
    [imageItem setItemClickBlock:^(id  _Nonnull target) {
        if (!weakself.picker) {
            weakself.picker = [ImagePickerController new];
        }
        [weakself.picker imagePickerCrop:self];
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

- (void)pickController:(ImagePickerController *)picker didFinishCropPhotos:(UIImage *)photo {
    SelectorItem *imageItem = [self findViewByName:@"selector_head"];
    UIImageView *imageView = [imageItem findViewByName:@"right_image"];
    imageView.image = photo;
}

@end
