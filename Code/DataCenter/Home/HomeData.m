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
    self.tech       = [NSMutableArray new];
    self.banner     = [NSMutableArray new];
    self.banner     = [NSMutableArray new];
}

- (void)setData:(Data *)data {
    [super setData:data];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    NSString *folder = [[NSBundle mainBundle] pathForResource:@"banner" ofType:nil];
    NSArray *fileList = [manager contentsOfDirectoryAtPath:folder error:&error];
    for (NSString *name in fileList) {
        BannerData *data = [BannerData new];
        data.imageUrl = [NSString stringWithFormat:@"%@/%@", folder, name];
        [self.banner addObject:data.imageUrl];
    }
}

@end
