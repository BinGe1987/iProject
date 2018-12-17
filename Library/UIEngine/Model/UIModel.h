//
//  UIModel.h
//  UIEngine
//
//  Created by BinGe on 2018/11/27.
//  Copyright © 2018 Bin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UIModel <NSObject>

- (id)getSource;

- (NSString *)getType;

- (NSString *)getString:(NSString *)key defaultValue:(NSString *)defValue;

- (int)getInteger:(NSString *)key defaultValue:(int)defValue;

- (NSArray *)getChildModels;

@end

NS_ASSUME_NONNULL_END
