//
//  TableViewAdapter.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import "TableViewSection.h"

@protocol TableViewAdapterDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface TableViewAdapter : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray<TableViewSection *> *data;
@property (nonatomic, assign) id delegate;

+ (instancetype)AdapterWithSourceData:(NSArray<TableViewSection *> *)data;

- (void)addSection:(TableViewSection *)section;
- (void)addSection:(TableViewSection *)section index:(NSInteger)insert;

- (void)removeSection:(TableViewSection *)section;

- (NSInteger)sectionIndex:(TableViewSection *)section;

@end

@protocol TableViewAdapterDelegate <NSObject>

- (void)adapter:(TableViewAdapter *)adapter didCellSelected:(TableViewCell *)cell;

@end

NS_ASSUME_NONNULL_END
