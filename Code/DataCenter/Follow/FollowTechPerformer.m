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

- (id)followTech:(id)params {
    return nil;
}

- (id)getFollowTechList:(id)params {
    return nil;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    return nil;
}

@end
