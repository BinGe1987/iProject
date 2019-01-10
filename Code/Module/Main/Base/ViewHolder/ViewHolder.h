//
//  ViewHolder.h
//  APP
//
//  Created by BinGe on 2019/1/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewHolder : NSObject

+ (void)getView:(NSString *)xml bindData:(id)data;

@end

NS_ASSUME_NONNULL_END
