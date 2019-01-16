//
//  ImagePickerController.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "ImagePickerController.h"
#import "TZImagePickerController.h"

@interface ImagePickerController()<TZImagePickerControllerDelegate>

@property (nonatomic, assign) id<ImagePickerControllerDelegate> delegate;

@end

@implementation ImagePickerController

- (void)imagePickerMaxCount:(NSInteger)maxCount delegate:(id<ImagePickerControllerDelegate>)delegate {
    self.delegate = delegate;
    TZImagePickerController *vc = [[TZImagePickerController alloc] initWithMaxImagesCount:maxCount delegate:self];
    vc.naviBgColor = [UIColor whiteColor];
    vc.naviTitleColor = [UIColor blackColor];
    vc.barItemTextColor = vc.naviTitleColor;
    vc.isStatusBarDefault = YES;
    [[UIViewController topViewController] presentViewController:vc animated:YES completion:nil];
}

- (void)imagePickerCrop:(id<ImagePickerControllerDelegate>)delegate {
    self.delegate = delegate;
    TZImagePickerController *vc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    int width = [UIScreen mainScreen].bounds.size.width;
    int height = [UIScreen mainScreen].bounds.size.height;
    int min = MIN(width, height);
    vc.cropRect = CGRectMake(width / 2 - min / 2, height / 2 - min / 2, min, min);
    vc.allowCrop = YES;
    vc.allowPickingImage = YES;
    vc.naviBgColor = [UIColor whiteColor];
    vc.naviTitleColor = [UIColor blackColor];
    vc.barItemTextColor = vc.naviTitleColor;
    vc.isStatusBarDefault = YES;
    [vc showProgressHUD];
    [[UIViewController topViewController] presentViewController:vc animated:YES completion:^{
        [vc hideProgressHUD];
    }];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    if ([self.delegate respondsToSelector:@selector(pickController:didFinishPickingPhotos:)]) {
        [self.delegate pickController:self didFinishPickingPhotos:photos];
    }
    if (picker.allowCrop) {
        if ([self.delegate respondsToSelector:@selector(pickController:didFinishCropPhotos:)]) {
            [self.delegate pickController:self didFinishCropPhotos:photos[0]];
        }
    }
}




@end
