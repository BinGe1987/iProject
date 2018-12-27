//
//  DiscoverHandler.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverHandler.h"
#import "DiscoverClubPerformer.h"
#import "DiscoverTechPerformer.h"

@interface DiscoverHandler()<IParser>

@property (nonatomic, strong) DiscoverData *data;

@end

@implementation DiscoverHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = [DiscoverData new];
        [self bind:OperationGetDiscoverClubData performer:[DiscoverClubPerformer new] parser:self];
        [self bind:OperationGetDiscoverTechData performer:[DiscoverTechPerformer new] parser:self];
    }
    return self;
}

- (id)parse:(id)operation withSource:(id)source {
    if ([operation isEqualToString:OperationGetDiscoverClubData]) {
        [self.data setClubData:source];
    }
    else if ([operation isEqualToString:OperationGetDiscoverTechData]) {
        [self.data setTechData:source];
    }
    return [self getData];
}

- (id)getData {
    return self.data;
}


@end
