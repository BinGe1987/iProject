//
//  FollowTechPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "FollowTechPerformer.h"

@implementation FollowTechPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    if ([operation isEqualToString:OperationFollowTech]) {
        return [self followTech:params];
    }
    else if ([operation isEqualToString:OperationGetMineFollowTechData]) {
        return [self getFollowTechList:params];
    }
    return nil;
}

- (id)followTech:(TechData *)tech {
    HttpRequest *request = [HttpRequest withHost:[URLConstant host] api:API_MineFollow];
    request.data = @{
                     @"token":DataCenter.token,
                     @"isFollow":tech.isFollow ? @"0" : @"1",
                     @"relationId":tech.techID,
                     @"type":@"tech",
                     };
    HttpResponse *response = [Http post:request];
    Data *data = [Data new];
    data.source = [response.data mutableCopy];
    data.error = response.error;
    if ([data isSuccess]) {
        tech.isFollow = !tech.isFollow;
        return tech;
    } else {
        return data;
    }
}

- (id)getFollowTechList:(id)params {
    return nil;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    return source;
}

@end
