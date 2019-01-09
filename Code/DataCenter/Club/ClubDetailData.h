//
//  ClubDetailData.h
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "Data.h"
#import "ListData.h"
#import "ClubData.h"
#import "ClubServiceData.h"
#import "CommentData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClubDetailData : Data

@property (nonatomic, strong) ClubData *clubData;

@property (nonatomic, strong) ListData *techList;
@property (nonatomic, strong) ListData *serviceList;
@property (nonatomic, strong) ListData *commentList;

@end

NS_ASSUME_NONNULL_END
