//
//  CommentCagetoryData.h
//  APP
//
//  Created by BinGe on 2019/1/10.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentCagetoryData : Data

@property (nonatomic, copy)     NSString *type;
@property (nonatomic, copy)     NSString *name;
@property (nonatomic, assign)   NSInteger isLock;
@property (nonatomic, assign)   NSInteger commentCount;

@end

NS_ASSUME_NONNULL_END
