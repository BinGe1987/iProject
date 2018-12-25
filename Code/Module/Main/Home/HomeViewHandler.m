//
//  HomeViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeViewHandler.h"
#import "HomeViewAdpater.h"

@interface HomeViewHandler()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    NSMutableArray *datas = [NSMutableArray array];
    for(int i = 0; i < 20; i++) {
        [datas addObject:[NSString stringWithFormat:@"table item %i", i]];
    }
    TableViewSection *section1 = [[TableViewSection alloc] initWithDictionary: @{@"name": @"123", @"array": datas,
                                                                                 @"height" : [NSNumber numberWithFloat:40],
                                                                                 @"headerHeight" : [NSNumber numberWithFloat:60],
                                                                                 @"footerHeight" : [NSNumber numberWithFloat:0]}];
    TableViewSection *section2 = [[TableViewSection alloc] initWithDictionary: @{@"name": @"123", @"array": datas,
                                                                                 @"height" : [NSNumber numberWithFloat:100],
                                                                                 @"headerHeight" : [NSNumber numberWithFloat:40],
                                                                                 @"footerHeight" : [NSNumber numberWithFloat:40]}];
    HomeViewAdpater *adapter = [HomeViewAdpater AdapterWithSourceData:@[section1,section2]];
    self.tableView = (UITableView *)view;
    [self.tableView setAdapter:adapter];
    return self;
}

@end
