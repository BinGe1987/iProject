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
    
    //tech
    //技师
    NSArray *tech = @[@{@"name":@"沐沐",@"number":@"25",@"image":@""},
                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
                      @{@"name":@"果果",@"number":@"9",@"image":@""},
                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
                      @{@"name":@"沐沐",@"number":@"25",@"image":@""},
                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
                      @{@"name":@"果果",@"number":@"9",@"image":@""},
                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
                      @{@"name":@"沐沐",@"number":@"25",@"image":@""},
                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
                      @{@"name":@"果果",@"number":@"9",@"image":@""},
                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
                      ];
    for (NSDictionary *dic in tech) {
        TechData *data = [TechData new];
        data.number = [dic objectForKey:@"number"];
        data.name = [dic objectForKey:@"name"];
        data.imageUrl = [dic objectForKey:@"image"];
        [self.tech addData:data];
        
        
    }
}

@end
