//
//  HomePerformer.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomePerformer.h"

@implementation HomePerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    
    if ([operation isEqualToString:OperationGetHomeData] ||
        [operation isEqualToString:OperationGetHomeDataBanner]) {
        [self operation:operation bannerAndClassifyData:callback];
    }
    
    return nil;
    
}

- (BOOL)isAsynchronous {
    return YES;
}

- (void)operation:(id)operation bannerAndClassifyData:(ICallback)callback {
    
    NSArray *bannerArray;
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_HomeBanner];
    request.timeout = 5;
    request.data = @{@"token":DataCenter.token};
    HttpResponse *bannerResponse = [Http post:request];
    if ([bannerResponse.data[@"statusCode"] intValue] == 200) {
        NSDictionary *respData = bannerResponse.data[@"respData"];
        bannerArray = respData[@"bannerList"];
        [Store setValue:bannerArray forKey:@"cache_home_banner"];
    }
    
    if (!bannerArray || ![bannerArray isKindOfClass:[NSArray class]]) {
        bannerArray = [Store valueForKey:@"cache_home_banner"];
    }
    
    if (!bannerArray || ![bannerArray isKindOfClass:[NSArray class]]) {
        bannerArray = @[@{@"id":@"1", @"imageUrl":@"@banner/banner1.jpg"},
                        @{@"id":@"2",@"imageUrl":@"@banner/banner2.jpg"},
                        @{@"id":@"3",@"imageUrl":@"@banner/banner3.jpg"},
                        @{@"id":@"4",@"imageUrl":@"@banner/banner4.jpg"},
                        @{@"id":@"5",@"imageUrl":@"@banner/banner5.jpg"}];
        
    }
    
    Data *data = [Data new];
    NSArray *classify = @[@{@"id":@"1",@"name":@"水疗"},
                          @{@"id":@"2",@"name":@"推拿"},
                          @{@"id":@"3",@"name":@"浴足"}];
    data.source = @{@"statusCode":@"200", @"respData":@{@"banner":bannerArray, @"classify":classify}};
    callback(operation, data);
}
 
@end
