//
//  ClubDetailPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailPerformer.h"
#import "ClubDetailData.h"

@implementation ClubDetailPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    return [Data new];
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    ClubDetailData *detail = [ClubDetailData new];
    //banner
    detail.bannerList = [ListData new];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    NSString *folder = [[NSBundle mainBundle] pathForResource:@"banner" ofType:nil];
    NSArray *fileList = [manager contentsOfDirectoryAtPath:folder error:&error];
    for (NSString *name in fileList) {
        BannerData *data = [BannerData new];
        data.imageUrl = [NSString stringWithFormat:@"%@/%@", folder, name];
        [detail.bannerList addData:data.imageUrl];
    }
    //会所数据
    detail.clubData = [ClubData new];
    detail.clubData.name = @"休闲养生演示会所";
    
    //技师
    detail.techList = [ListData new];
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
        [detail.techList addData:data];
    }
    
    return detail;
}

@end
