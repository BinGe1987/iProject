//
//  Data+Update.h
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data (Update)

//数据是否有更新
@property (nonatomic, assign) BOOL isDataUpdated;

- (NSInteger)statusCode;

- (BOOL)isSuccess;

- (NSString *)errorMessage;

@end

NS_ASSUME_NONNULL_END
