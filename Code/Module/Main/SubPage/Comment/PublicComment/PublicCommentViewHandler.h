//
//  PublicCommentViewHandler.h
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "ViewHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface PublicCommentViewHandler : ViewHandler

- (void)setTechList:(ListData *)listData;

- (void)uploadResponse:(Data *)data;

@end

NS_ASSUME_NONNULL_END
