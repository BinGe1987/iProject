//
//  RechargeData.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "RechargeData.h"

@implementation RechargeData

- (void)setData:(Data *)data {
    [super setData:data];
    JSON *json = [data jsonWithKey:@"respData"];
    self.totalRechargeAmount =  [json stringWithKey:@"totalRechargeAmount" defaultValue:@"0.0"];
    self.amount =               [json stringWithKey:@"amount" defaultValue:@"0.0"];
    self.rechargeTitle =        [json stringWithKey:@"rechargeTitle"];
    self.nextLevelAmount =      [json stringWithKey:@"nextLevelAmount" defaultValue:@"0.0"];
}

@end
