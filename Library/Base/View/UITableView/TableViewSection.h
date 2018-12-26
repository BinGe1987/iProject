//
//  TableViewSection.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewSection : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) NSArray *array;

///代码这个section只有一个section
@property (nonatomic, assign) BOOL oneCell;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
