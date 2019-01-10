//
//  CommentListData.h
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "Data.h"
#import "CommentCagetoryData.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentListData : ListData

@property (nonatomic, strong) ListData *filters;

@end

NS_ASSUME_NONNULL_END
