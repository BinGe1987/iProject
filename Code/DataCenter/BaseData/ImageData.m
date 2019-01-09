//
//  ImageData.m
//  APP
//
//  Created by BinGe on 2019/1/9.
//

#import "ImageData.h"

@implementation ImageData

- (void)setData:(Data *)data {
    [super setData:data];
    self.imageUrl = [data stringWithKey:@"imageUrl"];
}

@end
