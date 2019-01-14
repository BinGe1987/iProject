//
//  PhotoItem.m
//  APP
//
//  Created by BinGe on 2019/1/9.
//

#import "PhotoItem.h"

@implementation PhotoItem

- (instancetype)initWithView:( UIView * _Nullable )view image:(UIImage *)image {
    self = [super init];
    self.view = view;
    self.image = image;
    return self;
}

- (instancetype)initWithView:( UIView * _Nullable )view imageUrl:(NSString *)url {
    self = [super init];
    self.view = view;
    self.imageUrl = url;
    return self;
}

@end
