//
//  AutoTableViewAdapter.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "AutoTableViewAdapter.h"

@interface AutoTableViewAdapter()

@property (nonatomic, strong) NSMutableArray *sectionArray;

@property (nonatomic, strong) NSMutableDictionary *cellCache;

@end

@implementation AutoTableViewAdapter

+ (instancetype)adapterWithSection:(AutoTableViewSection *)section {
    return [AutoTableViewAdapter adapterWithSections:@[section]];
}

+ (instancetype)adapterWithSections:(AutoTableViewSection *)section {
    AutoTableViewAdapter *adapter = [[[self class] alloc] init];
    adapter.sectionArray = [section mutableCopy];
    return adapter;
}

- (void)addSection:(AutoTableViewSection *)section {
    [self.sectionArray addObject:section];
}

//多少个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionArray count];
}
//section有多少个项
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    AutoTableViewSection *tvSection = [self.sectionArray objectAtIndex:section];
    return [tvSection.dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoTableViewSection *section = [self.sectionArray objectAtIndex:indexPath.section];
    static NSString *identifier = @"dequeueReusableCellWithIdentifier";
    AutoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[section.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (!self.cellCache) {
        self.cellCache = [NSMutableDictionary new];
    }
    [self.cellCache setObject:cell forKey:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoTableViewSection *section = [self.sectionArray objectAtIndex:indexPath.section];
    AutoTableViewCell * cell = [self.cellCache objectForKey:indexPath];
    [self.cellCache removeObjectForKey:indexPath];
    [cell setCellData:section.dataArray[indexPath.row]];
    return [cell heightForCell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[AutoTableViewCell class]]) {
        AutoTableViewCell *tc = (AutoTableViewCell *)cell;
        [tc tableViewCellDidSelect:tableView];
    }
}

@end
