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

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
