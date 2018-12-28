//
//  OrderHandler.m
//  APP
//
//  Created by BinGe on 2018/12/28.
//

#import "OrderHandler.h"
#import "OrderPerformer.h"

@interface OrderHandler()<IParser>

@property (nonatomic, strong) ListData *listData;

@end

@implementation OrderHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.listData = [ListData new];
        [self bind:OperationGetOrderData performer:[OrderPerformer new] parser:self];
    }
    return self;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    [self.listData setData:source];
    
    for (int i=0; i<10; i++) {
        OrderData *order = [OrderData new];
        order.payTime = @"2018-11-27 23:49";
        order.payType = @"微信";
        order.writeOffCode = @"约多多";
        order.transAmount = 499;
        order.reduceAmount = 100;
        order.payAmount = 399;
        
        ClubData *clubData = [ClubData new];
        clubData.name = @"休闲养生演示会所";
        order.clubData = clubData;
        
        [self.listData addData:order];
    }
    
    return [self getData];
}

- (id)getData {
    return self.listData;
}

@end
