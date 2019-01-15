//
//  GlobalDataHandler.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "GlobalDataHandler.h"
#import "UploadPerformer.h"


@implementation GlobalDataHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self bind:OperationUploadData performerPlus:[UploadPerformer class]];
    }
    return self;
}

@end
