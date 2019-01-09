//
//  TableViewSection.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "TableViewSection.h"

@implementation TableViewSection

- (instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    self.name = dic[@"name"];
    self.height = [dic[@"height"] floatValue];
    self.headerHeight = [dic[@"headerHeight"] floatValue];
    self.footerHeight = [dic[@"footerHeight"] floatValue];
    self.array = [dic[@"array"] mutableCopy];
    return self;
}

@end
