//
//  DiscoverData.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverData.h"

@implementation DiscoverData

- (void)initialize {
    self.club       = [ListData new];
    self.tech       = [ListData new];
}

- (void)setData:(Data *)data {
    [super setData:data];

    //商家
    NSArray *club = @[@{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      @{@"name":@"小摩豆",@"image":@""},
                      ];
    for (NSDictionary *dic in club) {
        ClubData *data = [ClubData new];
        data.name = [dic objectForKey:@"name"];
        data.imageUrl = [dic objectForKey:@"image"];
        [self.club addData:data];
    }
}

@end
