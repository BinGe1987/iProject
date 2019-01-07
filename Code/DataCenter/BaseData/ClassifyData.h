//
//  ClassifyData.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClassifyData : Data

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END
