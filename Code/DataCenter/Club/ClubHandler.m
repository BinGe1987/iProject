//
//  ClubHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClubHandler.h"
#import "ClubDetailPerformer.h"
#import "ClubDetailParser.h"

@implementation ClubHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetClubDetailData performer:[ClubDetailPerformer new] parser:[ClubDetailParser new]];
    }
    return self;
}

- (id)getData {
    return nil;
}

@end
