//
//  ActionSheet.h
//  APP
//
//  Created by BinGe on 2019/1/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ActionSheet : NSObject

- (instancetype)initWithTitle:( NSString * _Nullable)title;
- (instancetype)initWithTitle:( NSString * _Nullable)title message:(NSString *_Nullable)message;

- (void)addItem:(NSString *)items block:(void(^)(void))block;

- (void)show;

@end

NS_ASSUME_NONNULL_END
