//
//  ClubTechListPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/13.
//

#import "ClubTechListPerformer.h"

@implementation ClubTechListPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    ClubData *club = params;
    //会所数据
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_ClubGetTechList];
    request.data = @{
                     @"token":DataCenter.token,
                     @"clubId":club.clubID,
                     @"name":@"",
                     @"page":@(1),
                     @"pageSize":@(20)
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    //技师
    if ([source isSuccess]) {
        ListData *techListData = [ListData withData:source];
        Data *respData = [source dataWithKey:@"respData"];
        NSArray *techList = [respData arrayWithKey:@"list"];
        for (Data *tech in techList) {
            [techListData addData:[TechData withData:tech]];
        }
        return techListData;
    } else {
        return source;
    }
}



@end
