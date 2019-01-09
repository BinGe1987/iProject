//
//  PhotoBrowser.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "PhotoBrowser.h"
#import "KSPhotoBrowser.h"

@implementation PhotoBrowser

+ (void)browserPhoto:(NSArray *)imageUrls selectedIndex:(NSInteger)selected fromSourceView:(UIImageView *)view {
    UIViewController *controller = [UIViewController topViewController];
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < imageUrls.count; i++) {
        NSString *url = [imageUrls[i] stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:view imageUrl:[NSURL URLWithString:url]];
        [items addObject:item];
    }
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:selected];
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleScale;
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlur;
    browser.loadingStyle = KSPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleDot;
    browser.bounces = NO;
    [browser showFromViewController:controller];
}

+ (void)browserPhotoItems:(NSArray<PhotoItem *> *)items selectedIndex:(NSInteger)selected {
    UIViewController *controller = [UIViewController topViewController];
    NSMutableArray *ksItems = @[].mutableCopy;
    for (int i = 0; i < items.count; i++) {
        NSString *url = [items[i].imageUrl stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:items[i].view imageUrl:[NSURL URLWithString:url]];
        [ksItems addObject:item];
    }
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:ksItems selectedIndex:selected];
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleScale;
    browser.backgroundStyle = KSPhotoBrowserBackgroundStyleBlur;
    browser.loadingStyle = KSPhotoBrowserImageLoadingStyleIndeterminate;
    browser.pageindicatorStyle = KSPhotoBrowserPageIndicatorStyleDot;
    browser.bounces = NO;
    [browser showFromViewController:controller];
}

+ (void)controller:(UIViewController *)controller browser:(NSArray *)array selectedIndex:(NSInteger)index {
    NSMutableArray *items = @[].mutableCopy;
    for (int i = 0; i < array.count; i++) {
        NSString *url = [array[i] stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
        KSPhotoItem *item = [KSPhotoItem itemWithSourceView:nil imageUrl:[NSURL URLWithString:url]];
        [items addObject:item];
    }
    KSPhotoBrowser *browser = [KSPhotoBrowser browserWithPhotoItems:items selectedIndex:index];
//    browser.delegate = self;
    browser.dismissalStyle = KSPhotoBrowserInteractiveDismissalStyleNone;
//    browser.backgroundStyle = _backgroundStyle;
//    browser.loadingStyle = _loadingStyle;
//    browser.pageindicatorStyle = _pageindicatorStyle;
//    browser.bounces = _bounces;
    [browser showFromViewController:controller];
}

@end
