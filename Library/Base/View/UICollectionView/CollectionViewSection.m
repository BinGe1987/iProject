//
//  CollectionViewSection.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "CollectionViewSection.h"

@implementation CollectionViewSection

- (instancetype)init
{
    self = [super init];
    self.name = @"CollectionViewSection";
    self.headerHeight = 0;
    self.footerHeight = 0;
    self.array = [NSArray new];
    self.itemSize = CGSizeMake(50, 50);
    return self;
}

@end
