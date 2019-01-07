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
        HomePerformer *performer = [HomePerformer new];
        [self bind:OperationGetHomeData                 performer:performer parser:self];
        [self bind:OperationGetHomeDataBanner           performer:performer parser:self];
        [self bind:OperationGetHomeDataTech             performer:performer parser:self];
        [self bind:OperationGetHomeDataClubDropdown     performer:performer parser:self];
        [self bind:OperationGetHomeDataClubDropup       performer:performer parser:self];
    }
    return self;
}

- (id)parse:(id)operation withSource:(id)source {
    [self.data setData:source];
    if ([operation isEqualToString:OperationGetHomeDataTech]) {
        Data *resp = [source jsonWithKey:@"respData"];
        NSArray *array = [resp arrayWithKey:@"techList"];
        [self.data.tech removeAllObjects];
        for (Data *data in array) {
            TechData *cd = [TechData withData:data];
            [self.data.tech addObject:cd];
        }
        return [self.data.tech mutableCopy];
    }
    else if ([operation isEqualToString:OperationGetHomeDataClubDropdown]) {
        Data *resp = [source jsonWithKey:@"respData"];
        NSArray *array = [resp arrayWithKey:@"clubList"];
        [self.data.club clear];
        for (Data *data in array) {
            ClubData *cd = [ClubData withData:data];
            [self.data.club addData:cd];
        }
        return [self.data.club.list mutableCopy];
    }
    else if ([operation isEqualToString:OperationGetHomeDataClubDropup]) {
        Data *resp = [source jsonWithKey:@"respData"];
        NSArray *array = [resp arrayWithKey:@"clubList"];
        NSMutableArray *clubArray = [NSMutableArray new];
        for (Data *data in array) {
            ClubData *cd = [ClubData withData:data];
            [clubArray addObject:cd];
            [self.data.club addData:cd];
        }
        return clubArray;
    } else {
        [self.data setData:source];
        return [self getData];
    }
}

- (id)getData {
    return self.data;
}

@end
