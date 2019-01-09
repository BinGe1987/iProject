//
//  PhotoItem.m
//  APP
//
//  Created by BinGe on 2019/1/9.
//

#import "PhotoItem.h"

@implementation PhotoItem

- (instancetype)initWithView:( UIImageView * _Nullable )view imageUrl:(NSString *)url {
    self = [super init];
    self.view = view;
    self.imageUrl = url;
    return self;
}

@end
