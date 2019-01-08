//
//  TechData.h
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@interface TechData : Data

@property (nonatomic, strong) NSString *techID;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *browseNum;
@property (nonatomic, strong) NSString *followNum;
@property (nonatomic, strong) NSString *commentNum;

@end

NS_ASSUME_NONNULL_END
