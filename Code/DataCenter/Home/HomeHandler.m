//
//  HomeHandler.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "HomeHandler.h"
#import "HomePerformer.h"


@interface HomeHandler()<IParser>

@property (nonatomic, strong) HomeData *data;

@end

@implementation HomeHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = [HomeData new];
        [self bind:OperationGetHomeData         performer:[HomePerformer new] parser:self];
        [self bind:OperationGetHomeDataBanner   performer:[HomePerformer new] parser:self];
        [self bind:OperationGetHomeDataClub     performer:[HomePerformer new] parser:self];
        [self bind:OperationGetHomeDataTech     performer:[HomePerformer new] parser:self];
    }
    return self;
}

- (id)parse:(id)operation withSource:(id)source {
    [self.data setData:source];
    return [self getData];
}

- (id)getData {
    return self.data;
}

@end
