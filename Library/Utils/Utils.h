//
//  Utils.h
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+ (BOOL)validateContactNumber:(NSString *)mobileNum;

+ (BOOL)compareWithOldArray:(NSArray *)oldArray newArray:(NSArray *)newArray;

@end

NS_ASSUME_NONNULL_END
