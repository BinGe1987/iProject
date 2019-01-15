//
//  AutoTableViewSection.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "AutoTableViewSection.h"

@implementation AutoTableViewSection

+ (id)sectionWithCellClass:(Class)cell dataSource:(NSArray *)array {
    AutoTableViewSection *section = [AutoTableViewSection new];
    section.cellClass = cell;
    section.dataArray = [array mutableCopy];
    return section;
}

+ (id)sectionWithCellClass:(Class)cell dataSource:(NSArray *)array cellHeight:(CGFloat)height {
    AutoTableViewSection *section = [AutoTableViewSection new];
    section.cellClass = cell;
    section.dataArray = [array mutableCopy];
    return section;
}

@end
