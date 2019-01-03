//
//  ClubHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubHandler.h"
#import "ClubDetailPerformer.h"

@implementation ClubHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetClubDetailData performerPlus:[ClubDetailPerformer class]];
    }
    return self;
}

@end
