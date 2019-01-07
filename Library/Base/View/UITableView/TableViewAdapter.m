//
//  TableViewAdapter.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "TableViewAdapter.h"

#define CellIdentifier(name) (name)


@implementation TableViewAdapter

+ (instancetype)AdapterWithSourceData:(NSArray<TableViewSection *> *)data {
    TableViewAdapter *adapter = [[[self class] alloc] init];
    adapter.data = [data mutableCopy];
    return adapter;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.data = [NSMutableArray new];
    }
    return self;
}

- (void)addSection:(TableViewSection *)section {
    if (![self.data containsObject:section]) {
        [self.data addObject:section];
    }
}
- (void)addSection:(TableViewSection *)section index:(NSInteger)insert {
    if ([self.data containsObject:section]) {
        [self.data removeObject:section];
    }
    [self.data insertObject:section atIndex:insert];
}

- (void)removeSection:(TableViewSection *)section {
    if ([self.data containsObject:section]) {
        [self.data removeObject:section];
    }
}

- (NSInteger)sectionIndex:(TableViewSection *)section {
    return [self.data indexOfObject:section];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TableViewSection *tvSection = [self.data objectAtIndex:section];
    return [tvSection.array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    TableViewSection *tvSection = [self.data objectAtIndex:section];
    return tvSection.height;
}

#pragma mark 头部
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    TableViewSection *tvSection = [self.data objectAtIndex:section];
    CGFloat height = tvSection.headerHeight ? tvSection.headerHeight : 0;
    return height;
}


#pragma mark 底部
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    TableViewSection *tvSection = [self.data objectAtIndex:section];
    return tvSection.footerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 0.01)];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * showUserInfoCellIdentifier = @"TableViewAdapterCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:showUserInfoCellIdentifier];
    }
    cell.textLabel.text = @"456";
    
    return cell;
}

@end
