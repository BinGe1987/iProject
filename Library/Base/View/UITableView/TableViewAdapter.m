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
    adapter.data = data;
    return adapter;
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
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    TableViewSection *tvSection = [self.data objectAtIndex:section];
    return tvSection.headerHeight;
}


#pragma mark 底部
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    TableViewSection *tvSection = [self.data objectAtIndex:section];
    return tvSection.footerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
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
