//
//  FollowDataHandler.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "FollowDataHandler.h"
#import "FollowClubPerformer.h"
#import "FollowTechPerformer.h"

@implementation FollowDataHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetMineFollowClubData performerPlus:[FollowClubPerformer class]];
        [self bind:OperationGetMineFollowTechData performerPlus:[FollowTechPerformer class]];
    }
    return self;
}

@end
