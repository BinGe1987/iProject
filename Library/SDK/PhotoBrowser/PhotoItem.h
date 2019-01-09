//
//  PhotoItem.h
//  APP
//
//  Created by BinGe on 2019/1/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoItem : NSObject

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, weak) UIImageView *view;

- (instancetype)initWithView:(UIImageView *)view imageUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
