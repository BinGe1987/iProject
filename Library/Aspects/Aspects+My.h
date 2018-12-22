//
//  Aspects+My.h
//  APP
//
//  Created by BinGe on 2018/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (My)

- (BOOL)hookBeforSelector:(SEL)selector block:(id)block;
- (BOOL)hookInsteadSelector:(SEL)selector block:(id)block;
- (BOOL)hookAfterSelector:(SEL)selector block:(id)block;

@end

NS_ASSUME_NONNULL_END
