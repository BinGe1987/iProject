//
//  HomeData.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeData.h"

@implementation HomeData

- (void)initialize {
    self.banner     = [NSMutableArray new];
    self.classify   = [NSMutableArray new];
    self.tech       = [NSMutableArray new];
    self.club       = [NSMutableArray new];
}

- (void)setData:(Data *)data {
    [super setData:data];
    
    NSArray *banner = [self checkData:@"banner"];
    if (banner) {
        [self setBannerData:banner];
    }
    
    NSArray *classify = [self checkData:@"classify"];
    if (classify) {
        [self setClassifyData:classify];
    }
}

- (NSArray *)checkData:(NSString *)dataType {
    if (self.isSuccess) {
        NSDictionary *dict = self.source[@"respData"];
        NSArray *array = [dict objectForKey:dataType];
        if (array && [array isKindOfClass:[NSArray class]] && array.count > 0) {
            return array;
        }
    }
    return nil;
}

- (void)setBannerData:(NSArray *)array {
    [self.banner removeAllObjects];
    for (NSDictionary *dict in array) {
        BannerData *bannerData = [BannerData withDictionary:dict];
        [self.banner addObject:bannerData];
    }
}

- (void)setClassifyData:(NSArray *)array {
    [self.classify removeAllObjects];
    for (NSDictionary *dict in array) {
        ClassifyData *classifyData = [ClassifyData withDictionary:dict];
        [self.classify addObject:classifyData];
    }
}








//    //banner
//    NSFileManager *manager = [NSFileManager defaultManager];
//    NSError *error;
//    NSString *folder = [[NSBundle mainBundle] pathForResource:@"banner" ofType:nil];
//    NSArray *fileList = [manager contentsOfDirectoryAtPath:folder error:&error];
//    for (NSString *name in fileList) {
//        BannerData *data = [BannerData new];
//        data.imageUrl = [NSString stringWithFormat:@"%@/%@", folder, name];
//        [self.banner addObject:data.imageUrl];
//    }
//
//    //分类
//    NSArray *classify = @[@{@"name":@"hydrotherapy",@"title":@"水疗",@"image":@"@水疗"},
//                          @{@"name":@"Tuina",@"title":@"推拿",@"image":@"@推拿"},
//                          @{@"name":@"foot-bathing",@"title":@" 浴足",@"image":@"@浴足"}
//                          ];
//    for (NSDictionary *dic in classify) {
//        ClassifyData *data = [ClassifyData new];
//        data.name = [dic objectForKey:@"name"];
//        data.title = [dic objectForKey:@"title"];
//        data.image = [dic objectForKey:@"image"];
//        [self.classify addObject:data];
//    }
//
//    //技师
//    NSArray *tech = @[@{@"name":@"沐沐",@"number":@"25",@"image":@""},
//                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
//                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
//                      @{@"name":@"果果",@"number":@"9",@"image":@""},
//                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
//                      @{@"name":@"沐沐",@"number":@"25",@"image":@""},
//                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
//                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
//                      @{@"name":@"果果",@"number":@"9",@"image":@""},
//                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
//                      @{@"name":@"沐沐",@"number":@"25",@"image":@""},
//                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
//                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
//                      @{@"name":@"果果",@"number":@"9",@"image":@""},
//                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
//                          ];
//    for (NSDictionary *dic in tech) {
//        TechData *data = [TechData new];
//        data.number = [dic objectForKey:@"number"];
//        data.name = [dic objectForKey:@"name"];
//        data.imageUrl = [dic objectForKey:@"image"];
//        [self.tech addObject:data];
//    }
//
//    //商家
//    NSArray *club = @[@{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      @{@"name":@"小摩豆",@"image":@""},
//                      ];
//    for (NSDictionary *dic in club) {
//        ClubData *data = [ClubData new];
//        data.name = [dic objectForKey:@"name"];
//        data.imageUrl = [dic objectForKey:@"image"];
//        [self.club addObject:data];
//    }
@end
