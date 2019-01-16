//
//  ImagePickerController.h
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import <Foundation/Foundation.h>

@protocol ImagePickerControllerDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface ImagePickerController : NSObject

- (void)imagePickerMaxCount:(NSInteger)maxCount delegate:(id<ImagePickerControllerDelegate>)delegate;

- (void)imagePickerCrop:(id<ImagePickerControllerDelegate>)delegate;

@end

@protocol ImagePickerControllerDelegate <NSObject>

@optional
- (void)pickController:(ImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos;
- (void)pickController:(ImagePickerController *)picker didFinishCropPhotos:(UIImage *)photo;

@end


NS_ASSUME_NONNULL_END
