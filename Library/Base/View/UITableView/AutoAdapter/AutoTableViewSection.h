//
//  AutoTableViewSection.h
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoTableViewSection : NSObject

@property (nonatomic, strong) Class cellClass;
@property (nonatomic, strong) NSMutableArray *dataArray;

+ (id)sectionWithCellClass:(Class)cell dataSource:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
