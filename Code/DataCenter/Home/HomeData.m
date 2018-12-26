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
    
    //banner
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    NSString *folder = [[NSBundle mainBundle] pathForResource:@"banner" ofType:nil];
    NSArray *fileList = [manager contentsOfDirectoryAtPath:folder error:&error];
    for (NSString *name in fileList) {
        BannerData *data = [BannerData new];
        data.imageUrl = [NSString stringWithFormat:@"%@/%@", folder, name];
        [self.banner addObject:data.imageUrl];
    }
    
    //分类
    NSArray *classify = @[@{@"name":@"hydrotherapy",@"title":@"水疗",@"image":@"@水疗"},
                          @{@"name":@"Tuina",@"title":@"推拿",@"image":@"@推拿"},
                          @{@"name":@"foot-bathing",@"title":@" 浴足",@"image":@"@浴足"}
                          ];
    for (NSDictionary *dic in classify) {
        ClassifyData *data = [ClassifyData new];
        data.name = [dic objectForKey:@"name"];
        data.title = [dic objectForKey:@"title"];
        data.image = [dic objectForKey:@"image"];
        [self.classify addObject:data];
    }
    
}

@end
