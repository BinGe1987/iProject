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
    [[UIViewController topViewController] presentViewController:vc animated:YES completion:nil];
//    [vc setDidFinishPickingVideoHandle:^(UIImage *coverImage, PHAsset *asset) {
//
//    }];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    if ([self.delegate respondsToSelector:@selector(pickController:didFinishPickingPhotos:)]) {
        [self.delegate pickController:self didFinishPickingPhotos:photos];
    }
}




@end
