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
    
    SelectorItem *nicknameItem = [self findViewByName:@"selector_nickname"];
    [nicknameItem setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"NiceNameEditController" animated:YES data:nil];
    }];
    
    
    SelectorItem *genderItem = [self findViewByName:@"selector_gender"];
    [genderItem setItemClickBlock:^(id  _Nonnull target) {
        ActionSheet *actionSheet = [ActionSheet new];
        [actionSheet addItem:@"男" block:^{
            NSLog(@"男");
            [weakself editGender:@"male"];
        }];
        [actionSheet addItem:@"女" block:^{
            NSLog(@"女");
            [weakself editGender:@"female"];
        }];
        [actionSheet show];
    }];
    
    SelectorItem *phoneItem = [self findViewByName:@"selector_phone"];
    [phoneItem setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"EditPhoneController" animated:YES data:nil];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateInfo];
}

- (void)updateInfo {
    UserData *user = [DataCenter get].userData;
    
    UIImageView *imageView = [self findViewByName:@"image_head"];
    [imageView setImageWithURL:[NSURL URLWithString:user.avatarUrl]];
    
    UILabel *nickNameLabel = [self findViewByName:@"label_nickname"];
    nickNameLabel.text = user.userName;
    
    UILabel *genderLabel = [self findViewByName:@"label_gender"];
    genderLabel.text = [user genderLabel];
    
    UILabel *phoneLabel = [self findViewByName:@"label_phone"];
    phoneLabel.text = user.phone;
    
    ViewGroup *root = [self findViewByName:@"root"];
    [root boundsAndRefreshLayout];
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
                    [imageView setImageWithURL:[NSURL URLWithString:user.avatarUrl] placeholder:image];
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

- (void)editGender:(NSString *)gender {
    NSDictionary *params = @{@"gender":gender};
    WeakSelf(self)
    SelectorItem *genderItem = [self findViewByName:@"selector_gender"];
    genderItem.userInteractionEnabled = NO;
    [genderItem showLoadingViewGrivaty:LoadingViewGravityCenter|LoadingViewGravityRight padding:UIEdgeInsetsMake(0, 0, 0, 50)];
    [DataCenter perform:OperationEditMineData params:params callback:^(id  _Nonnull operation, Data * _Nullable data) {
        [genderItem stopLoading];
        genderItem.userInteractionEnabled = YES;
        if ([data isSuccess]) {
            [weakself updateInfo];
        } else {
            [ProgressHUB showTips:[data errorMessage]];
        }
    }];
}

@end
