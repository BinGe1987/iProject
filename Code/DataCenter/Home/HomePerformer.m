//
//  HomePerformer.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomePerformer.h"

@implementation HomePerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    if ([operation isEqualToString:OperationGetHomeDataBanner]) {
        [self operation:operation bannerAndClassifyData:callback];
    }
    
    
//    NSArray *bannerArray = [self bannerArray];
//    Data *data = [Data new];
//    data.source = @{@"statusCode":@"200", @"respData":@{ @"banner":bannerArray}};

//    HttpRequest *bannerRequest = [HttpRequest new];
//    bannerRequest.url = [URLConstant URLWithApi:API_HomeBanner];
//    bannerRequest.data = @{@"token":DataCenter.token};
//    HttpResponse *bannerResponse = [Http post:bannerRequest];
//    Data *bannerData = [Data new];
//    bannerData.source = bannerResponse.data;
//    bannerData.error = bannerResponse.error;
//    if ([bannerResponse.data[@"statusCode"] intValue] == 200) {
//        [Store setValue:bannerResponse.data[@"respData"] forKey:@"banner"];
//    }
//    NSDictionary *bannerDict = [Store valueForKey:@"banner"];
    

//    HttpRequest *techRequest = [HttpRequest new];
//    techRequest.url = [URLConstant URLWithApi:API_HomeTech];
//    techRequest.data = @{@"token":DataCenter.token};
//    HttpResponse *techResponse = [Http post:techRequest];
//    Data *techData = [Data new];
//    techData.source = techResponse.data;
//    techData.error = techResponse.error;
//    if ([techResponse.data[@"statusCode"] intValue] == 200) {
//        [Store setValue:techResponse.data[@"respData"] forKey:@"tech"];
//    }
//    NSDictionary *techDict = [Store valueForKey:@"tech"];
//
//    HttpRequest *clubRequest = [HttpRequest new];
//    clubRequest.url = [URLConstant URLWithApi:API_HomeClub];
//    clubRequest.data = @{@"token":DataCenter.token};
//    HttpResponse *clubResponse = [Http post:clubRequest];
//    Data *clubData = [Data new];
//    clubData.source = clubResponse.data;
//    clubData.error = clubResponse.error;
//    if ([techResponse.data[@"statusCode"] intValue] == 200) {
//        [Store setValue:clubResponse.data[@"respData"] forKey:@"club"];
//    }
//    NSDictionary *clubDict = [Store valueForKey:@"club"];
//
//    Data *data = [Data new];
//    data.source = @{@"statusCode":@"200",
//                    @"respData":@{
//                            @"banner":bannerDict,
//                            @"tech":techDict,
//                            @"club":clubDict,
//                            },
//                    };
    
//    return data;
    return nil;
    
}

- (BOOL)isAsynchronous {
    return YES;
}

/**
respData =     {
    bannerList =         (
                          {
                              createTime = "2018-12-25 10:17:36";
                              id = 1;
                              imageUrl = "http://pk32xkytj.bkt.clouddn.com/banner1.jpg";
                              modifyTime = "2018-12-25 10:17:36";
                              relationId = 0;
                              sort = 10;
                              status = 1;
                              type = 0;
                          },
                          {
                              createTime = "2018-12-25 10:17:36";
                              id = 2;
                              imageUrl = "http://pk32xkytj.bkt.clouddn.com/banner2.jpg";
                              modifyTime = "2018-12-25 10:17:36";
                              relationId = 0;
                              sort = 10;
                              status = 1;
                              type = 0;
                          },
                          {
                              createTime = "2018-12-25 10:17:36";
                              id = 3;
                              imageUrl = "http://pk32xkytj.bkt.clouddn.com/banner3.jpg";
                              modifyTime = "2018-12-25 10:17:36";
                              relationId = 0;
                              sort = 10;
                              status = 1;
                              type = 0;
                          },
                          {
                              createTime = "2018-12-25 10:17:36";
                              id = 4;
                              imageUrl = "http://pk32xkytj.bkt.clouddn.com/banner4.jpg";
                              modifyTime = "2018-12-25 10:17:36";
                              relationId = 0;
                              sort = 10;
                              status = 1;
                              type = 0;
                          },
                          {
                              createTime = "2018-12-25 10:17:36";
                              id = 5;
                              imageUrl = "http://pk32xkytj.bkt.clouddn.com/banner5.jpg";
                              modifyTime = "2018-12-25 10:17:36";
                              relationId = 0;
                              sort = 10;
                              status = 1;
                              type = 0;
                          }
                          );
};
*/

- (void)operation:(id)operation bannerAndClassifyData:(ICallback)callback {
    
    NSArray *bannerArray;
    
    HttpRequest *bannerRequest = [HttpRequest new];
    bannerRequest.timeout = 5;
    bannerRequest.url = [URLConstant URLWithApi:API_HomeBanner];
    bannerRequest.data = @{@"token":DataCenter.token};
    HttpResponse *bannerResponse = [Http post:bannerRequest];
    Data *bannerData = [Data new];
    bannerData.source = bannerResponse.data;
    bannerData.error = bannerResponse.error;
    if ([bannerResponse.data[@"statusCode"] intValue] == 200) {
        NSDictionary *respData = bannerResponse.data[@"respData"];
        bannerArray = respData[@"bannerList"];
        [Store setValue:bannerArray forKey:@"cache_home_banner"];
    }
    
    if (!bannerArray || ![bannerArray isKindOfClass:[NSArray class]]) {
        bannerArray = [Store valueForKey:@"cache_home_banner"];
    }
    
    if (!bannerArray || ![bannerArray isKindOfClass:[NSArray class]]) {
        bannerArray = @[@{@"imageUrl":@"@banner/banner1.jpg"},
                        @{@"imageUrl":@"@banner/banner2.jpg"},
                        @{@"imageUrl":@"@banner/banner3.jpg"},
                        @{@"imageUrl":@"@banner/banner4.jpg"},
                        @{@"imageUrl":@"@banner/banner5.jpg"}];
        
    }
    
    Data *data = [Data new];
    data.source = @{@"statusCode":@"200", @"respData":@{ @"banner":bannerArray}};
    callback(operation, data);
}
 
@end
