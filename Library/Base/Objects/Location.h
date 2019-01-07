//
//  Location.h
//  APP
//
//  Created by BinGe on 2019/1/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject

@property (nonatomic, assign) CGFloat longitude;    //经度
@property (nonatomic, assign) CGFloat latitude;     //纬度

+ (instancetype)newWithLongitude:(CGFloat)longitude latitude:(CGFloat)latitude;

@end

NS_ASSUME_NONNULL_END
