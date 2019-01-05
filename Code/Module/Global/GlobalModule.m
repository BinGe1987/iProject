//
//  GlobalModule.m
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "GlobalModule.h"
#import "Network.h"

@implementation GlobalModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    [Network start];
}

@end
