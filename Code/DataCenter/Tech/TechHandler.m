//
//  TechHandler.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "TechHandler.h"
#import "TechDetailPerformer.h"

@implementation TechHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationGetTechDetailData performer:[TechDetailPerformer class]];
    }
    return self;
}

@end
