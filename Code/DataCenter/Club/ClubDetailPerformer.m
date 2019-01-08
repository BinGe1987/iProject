//
//  ClubDetailPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubDetailPerformer.h"
#import "ClubDetailData.h"

@implementation ClubDetailPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    
    NSMutableDictionary *respDict = [NSMutableDictionary new];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"200",@"statusCode",respDict, @"respData", nil];
    
    ClubData *club = (ClubData *)params;
    
    Data *profile = [self profile:club];
    if ([profile isSuccess]) {
        Data *resp = [profile dataWithKey:@"respData"];
        [respDict setObject:resp.source forKey:@"club_profile"];
    } else {
        return profile;
    }
    
    Data *tech = [self techList:club];
    if ([tech isSuccess]) {
        Data *resp = [tech dataWithKey:@"respData"];
        [respDict setObject:resp.source forKey:@"club_tech"];
    } else {
        return tech;
    }
    
    Data *service = [self service:club];
    if ([service isSuccess]) {
        Data *resp = [service dataWithKey:@"respData"];
        [respDict setObject:resp.source forKey:@"club_service"];
    } else {
        return service;
    }
    
    Data *comment = [self service:club];
    if ([comment isSuccess]) {
        Data *resp = [comment dataWithKey:@"respData"];
        [respDict setObject:resp.source forKey:@"club_comment"];
    } else {
        return comment;
    }
    
    return [Data withDictionary:dict];
}

- (Data *)profile:(ClubData *)club {
    //会所数据
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_ClubGetProfile];
    request.data = @{
                     @"token":DataCenter.token,
                     @"clubId":club.clubID,
                     @"laty":@(club.laty),
                     @"lngx":@(club.lngx)
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

- (Data *)techList:(ClubData *)club {
    //会所数据
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_ClubGetTechList];
    request.data = @{
                     @"token":DataCenter.token,
                     @"clubId":club.clubID,
                     @"name":@"",
                     @"page":@(1),
                     @"pageSize":@(4)
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

- (Data *)service:(ClubData *)club {
    //会所数据
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_ClubGetServiceList];
    request.data = @{
                     @"token":DataCenter.token,
                     @"clubId":club.clubID,
                     @"page":@(1),
                     @"pageSize":@(6)
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

- (Data *)comment:(ClubData *)club {
    //会所数据
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_ClubGetCommentList];
    request.data = @{
                     @"token":DataCenter.token,
                     @"clubId":club.clubID,
                     @"page":@(1),
                     @"pageSize":@(1),
                     @"type":@"high"
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = response.data;
    data.error = response.error;
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    if (![source isSuccess]) {
        return source;
    }
    
    Data *respData = [source dataWithKey:@"respData"];
    ClubDetailData *detail = [ClubDetailData new];
    
    //会所数据
    Data *clubSource = [respData dataWithKey:@"club_profile"];
    detail.clubData = [ClubData withData:clubSource];
    
    //banner
    detail.clubData.bannerList = [ListData new];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    NSString *folder = [[NSBundle mainBundle] pathForResource:@"banner" ofType:nil];
    NSArray *fileList = [manager contentsOfDirectoryAtPath:folder error:&error];
    for (NSString *name in fileList) {
        BannerData *data = [BannerData new];
        data.imageUrl = [NSString stringWithFormat:@"%@/%@", folder, name];
        [detail.clubData.bannerList addData:data.imageUrl];
    }
    
    
    //技师
    detail.techList = [ListData new];
    NSArray *tech = @[@{@"name":@"沐沐",@"number":@"25",@"image":@""},
                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
                      @{@"name":@"果果",@"number":@"9",@"image":@""},
                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
                      @{@"name":@"沐沐",@"number":@"25",@"image":@""},
                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
                      @{@"name":@"果果",@"number":@"9",@"image":@""},
                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
                      @{@"name":@"沐沐",@"number":@"25",@"image":@""},
                      @{@"name":@"夏夏",@"number":@"46",@"image":@""},
                      @{@"name":@"甜甜",@"number":@"666",@"image":@""},
                      @{@"name":@"果果",@"number":@"9",@"image":@""},
                      @{@"name":@"莉莉",@"number":@"88",@"image":@""},
                      ];
    for (NSDictionary *dic in tech) {
        TechData *data = [TechData new];
        data.number = [dic objectForKey:@"number"];
        data.name = [dic objectForKey:@"name"];
        data.imageUrl = [dic objectForKey:@"image"];
        [detail.techList addData:data];
    }
    
    detail.projectList = [ListData new];
    
    detail.commentList = [ListData new];
    
    return detail;
}

@end
