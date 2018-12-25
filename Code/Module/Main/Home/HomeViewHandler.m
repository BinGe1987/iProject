//
//  HomeViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeViewHandler.h"

@interface HomeViewHandler()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.tableView = (UITableView *)view;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.datas = [NSMutableArray array];
    for(int i = 0; i < 20; i++) {
        [self.datas addObject:[NSString stringWithFormat:@"table item %i", i]];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:showUserInfoCellIdentifier];
    }
    return cell;
}
@end
