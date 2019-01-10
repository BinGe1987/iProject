//
//  PhotoBrowser.h
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import <Foundation/Foundation.h>
#import "PhotoItem.h"

NS_ASSUME_NONNULL_BEGIN


@protocol PhotoBrowserDelegate;
@interface PhotoBrowser : NSObject

@property (nonatomic, assign) id<PhotoBrowserDelegate> delegate;

- (void)browserPhotoItems:(NSArray<PhotoItem *> *)items selectedIndex:(NSInteger)selected;

- (void)browserPhotoItems:(NSArray<PhotoItem *> *)items selectedIndex:(NSInteger)selected delegate:(_Nullable id<PhotoBrowserDelegate>)delegate;

@end

@protocol PhotoBrowserDelegate <NSObject>

- (void)photoBrowser:(PhotoBrowser *)browser didSelectItem:(PhotoItem  * _Nullable)item atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
