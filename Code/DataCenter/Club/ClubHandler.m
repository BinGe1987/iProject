//
//  ClubHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubHandler.h"
#import "ClubDetailPerformer.h"
#import "ClubFilterPerformer.h"
#import "ClubTechListPerformer.h"

@implementation ClubHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetClubDetailData performerPlus:[ClubDetailPerformer class]];
        [self bind:OperationGetClubFilterData performerPlus:[ClubFilterPerformer class]];
        [self bind:OperationGetClubTechListData performerPlus:[ClubTechListPerformer class]];
        
    }
    return self;
}

@end
