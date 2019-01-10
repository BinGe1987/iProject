//
//  PhotoBrowser.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "PhotoBrowser.h"
#import "KSPhotoBrowser.h"

@interface PhotoBrowser()<KSPhotoBrowserDelegate>

@end

@implementation PhotoBrowser

- (void)browserPhotoItems:(NSArray<PhotoItem *> *)items selectedIndex:(NSInteger)selected {
    [self browserPhotoItems:items selectedIndex:selected delegate:nil];
}

- (void)browserPhotoItems:(NSArray<PhotoItem *> *)items selectedIndex:(NSInteger)selected delegate:(_Nullable id<PhotoBrowserDelegate>)delegate{
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
    browser.delegate = self;
    [browser showFromViewController:controller];
    
    self.delegate = delegate;
}

- (void)ks_photoBrowser:(KSPhotoBrowser *)browser didSelectItem:(KSPhotoItem *)item atIndex:(NSUInteger)index {
    if (self.delegate) {
        PhotoItem *photoItem = [[PhotoItem alloc] initWithView:(UIImageView *)item.sourceView imageUrl:@""];
        [self.delegate photoBrowser:self didSelectItem:photoItem atIndex:index];
    }
}

@end
