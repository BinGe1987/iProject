//
//  TableViewSection.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <Foundation/Foundation.h>
#import "TableViewSectionRow.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewSection : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, strong) NSMutableArray<TableViewSectionRow *> *rows;



- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
