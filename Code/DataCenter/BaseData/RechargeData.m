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
    
    self.rechargeTitle =        [json stringWithKey:@"rechargeTitle"];
    
    self.amount =               [json integerWithKey:@"amount"];
    self.totalRechargeAmount =  [json integerWithKey:@"totalRechargeAmount"];
    self.nextLevelAmount =      [json integerWithKey:@"nextLevelAmount"];
}

@end
