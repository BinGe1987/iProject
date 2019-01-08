//
//  DropdownMenuItem.h
//  APP
//
//  Created by BinGe on 2018/12/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DropdownMenuItem : NSObject

@property (nonatomic, retain)   id                              data;

@property (nonatomic, copy)     NSString                        *itemID;
@property (nonatomic, copy)     NSString                        *name;
@property (nonatomic, strong)   UIImage                         *icon;
@property (nonatomic, strong)   NSArray<DropdownMenuItem *>     *childItems;

- (instancetype)initWithID:(NSString *)itemID name:(NSString *)name;

- (instancetype)initWithID:(NSString *)itemID name:(NSString *)name icon:(UIImage * _Nullable)icon;

@end

NS_ASSUME_NONNULL_END
