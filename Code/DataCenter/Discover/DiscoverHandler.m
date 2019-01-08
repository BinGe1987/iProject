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
        DiscoverClubPerformer *club = [DiscoverClubPerformer new];
        [self bind:OperationGetDiscoverClubData performer:club parser:self];
        [self bind:OperationGetDiscoverClubDataDropUp performer:club parser:self];
        
        DiscoverTechPerformer *tech = [DiscoverTechPerformer new];
        [self bind:OperationGetDiscoverTechData performer:tech parser:self];
        [self bind:OperationGetDiscoverTechDataDropUp performer:tech parser:self];
    }
    return self;
}

- (id)parse:(id)operation withSource:(id)source {
    if ([operation isEqualToString:OperationGetDiscoverClubData]) {
        [self.data setClubData:source];
    }
    else if ([operation isEqualToString:OperationGetDiscoverClubDataDropUp]) {
        [self.data addClubData:source];
    }
    else if ([operation isEqualToString:OperationGetDiscoverTechData]) {
        [self.data setTechData:source];
    }
    else if ([operation isEqualToString:OperationGetDiscoverTechDataDropUp]) {
        [self.data addTechData:source];
    }
    return [self getData];
}

- (id)getData {
    return self.data;
}


@end
