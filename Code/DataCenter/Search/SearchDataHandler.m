//
//  SearchDataHandler.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchDataHandler.h"
#import "SearchPerformer.h"

@implementation SearchDataHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetClubSearchData performerPlus:[SearchPerformer class]];
    }
    return self;
}

@end
