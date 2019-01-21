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
    UIImageView *imageView = [self findViewByName:@"image_head"];
    UserData *user = [DataCenter get].userData;
    [imageView setImageWithURL:[NSURL URLWithString:user.avatarUrl]];
    
    SelectorItem *nicenameItem = [self findViewByName:@"selector_nicename"];
    [nicenameItem setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"NiceNameEditController" animated:YES data:nil];
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
    
    SelectorItem *phoneItem = [self findViewByName:@"selector_phone"];
    [phoneItem setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"EditPhoneController" animated:YES data:nil];
    }];
}

- (void)pickController:(ImagePickerController *)picker didFinishCropPhotos:(UIImage *)photo {
//    UIImage *image = [ImageUtils scaleImage:photo toScale:0.5];
//    UIImage *image = [ImageUtils zipImage:photo toFileSize:1000];
    UIImage *image = photo;
    UIImageView *imageView = [self findViewByName:@"image_head"];
    imageView.image = image;
    UIActivityIndicatorView *indicator = [imageView viewWithTag:99];
    if (!indicator) {
        indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
        indicator.tag = 99;
        indicator.hidesWhenStopped = YES;
        indicator.backgroundColor = [ColorUtils colorWithString:@"#88ffffff"];
        indicator.color = [UIColor blackColor];
        [imageView addSubview:indicator];
    }
    indicator.frame = CGRectMake(0, 0, imageView.width, imageView.height);
    [indicator startAnimating];
    
    [DataCenter perform:OperationUploadData params:image callback:^(id  _Nonnull operation, Data * _Nullable data) {
        //图片上传成功
        WeakSelf(self)
        if ([data isSuccess]) {
            //更新用户信息
            Data *respData = [data dataWithKey:@"respData"];
            NSString *url = [respData stringWithKey:@"url"];
            NSDictionary *params = @{@"avatarUrl": url};
            [DataCenter perform:OperationEditMineData params:params callback:^(id  _Nonnull operation, Data * _Nullable data) {
                //图片上传成功
                UIImageView *imageView = [weakself findViewByName:@"image_head"];
                UIActivityIndicatorView *indicator = [imageView viewWithTag:99];
                [indicator stopAnimating];
                if ([data isSuccess]) {
                    UIImageView *imageView = [weakself findViewByName:@"image_head"];
                    UserData *user = [DataCenter get].userData;
                    [imageView setImageWithURL:[NSURL URLWithString:user.avatarUrl]];
                }
            }];
        } else {
            UIImageView *imageView = [weakself findViewByName:@"image_head"];
            UIActivityIndicatorView *indicator = [imageView viewWithTag:99];
            [indicator stopAnimating];
            [ProgressHUB showTips:@"上传失败"];
        }
    }];
}

@end
