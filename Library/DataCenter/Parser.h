//
//  Parser.h
//  APP
//
//  Created by BinGe on 2018/12/11.
//

#import <Foundation/Foundation.h>

@protocol IParser <NSObject>

- (id _Nullable )parse:(_Nonnull id)operation withSource:(id _Nullable )source;

@end

NS_ASSUME_NONNULL_BEGIN

@interface Parser : NSObject<IParser>

@end

NS_ASSUME_NONNULL_END
