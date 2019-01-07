//
//  TableViewAdapter.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import "TableViewSection.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewAdapter : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray<TableViewSection *> *data;

+ (instancetype)AdapterWithSourceData:(NSMutableArray<TableViewSection *> *)data;

- (void)addSection:(TableViewSection *)section;
- (void)addSection:(TableViewSection *)section index:(NSInteger)insert;


- (void)removeSection:(TableViewSection *)section;

@end

NS_ASSUME_NONNULL_END
