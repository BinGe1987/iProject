//
//  DataHandler.h
//  YDD
//
//  Created by BinGe on 2018/12/4.
//

#import <Foundation/Foundation.h>
#import "Performer.h"
#import "Parser.h"
#import "Performer+Parser.h"

@protocol HandlerDelegate <NSObject>

@required
- (id _Nullable )getData;

@end

NS_ASSUME_NONNULL_BEGIN

@interface DataHandler : NSObject

@property (nonatomic, assign) id<HandlerDelegate> delegate;

#pragma -mark IPerformer 判断、获取、绑定
- (BOOL)isContainsPerformer:(id)operation;

- (id<IPerformer>)getPerformer:(id)operation;

- (BOOL)bind:(id)operation performer:(id<IPerformer>)performer;

#pragma -mark IParser 判断、绑定、处理
- (BOOL)isContainsParser:(id)operation;

- (BOOL)bind:(id)operation parser:(id<IParser>)parser;

- (id)parseData:(id)operation withSourceData:(id)source;

- (void)bind:(id)operation performer:(_Nullable id<IPerformer>)performer parser:(_Nullable id<IParser>)parser;

- (void)bind:(id)operation performerPlus:(Class)performerPlusClas;


@end

NS_ASSUME_NONNULL_END
