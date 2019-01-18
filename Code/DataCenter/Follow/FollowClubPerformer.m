//
//  FollowClubPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "FollowClubPerformer.h"

@implementation FollowClubPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    if ([operation isEqualToString:OperationFollowClub]) {
        return [self followClub:params];
    }
    else if ([operation isEqualToString:OperationGetMineFollowClubData]) {
        return [self getFollowClubList:params];
    }
    return nil;
}

- (id)followClub:(ClubData *)club {
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_MineFollow];
    request.data = @{
                     @"token":DataCenter.token,
                     @"isFollow":club.isFollow ? @"0" : @"1",
                     @"relationId":club.clubID,
                     @"type":@"club",
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    if ([data isSuccess]) {
        club.isFollow = !club.isFollow;
        return club;
    } else {
        return data;
    }
    
}

- (id)getFollowClubList:(id)params {
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_MineFollowClub];
    request.data = @{
                     @"token":DataCenter.token,
                     @"laty":@([DataCenter get].userData.laty),
                     @"lngx":@([DataCenter get].userData.lngx),
                     @"page":@"0",
                     @"pageSize":@"20",
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    if ([data isSuccess]) {
        ListData *listData = [ListData withData:data];
        Data *respData = [listData dataWithKey:@"respData"];
        NSArray *list = [respData arrayWithKey:@"list"];
        for(Data *d in list) {
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
            [listData addData:[ClubData withData:d]];
        }
        return listData;
    } else {
        return data;
    }
}


- (id)parse:(_Nonnull id)operation withSource:(id)source {
    return source;
}

@end
