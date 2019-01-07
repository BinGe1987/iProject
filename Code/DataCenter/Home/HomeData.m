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
    self.club       = [ClubListData new];
}

- (void)setData:(Data *)data {
    [super setData:data];
    NSArray *banner = [self checkArray:@"bannerList"];
    if (banner) {
        [self setBannerData:banner];
    }
    NSArray *classify = [self checkArray:@"classifyList"];
    if (classify) {
        [self setClassifyData:classify];
    }
}

- (NSArray *)checkArray:(NSString *)dataType {
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


@end
