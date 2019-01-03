//
//  MinePresenter.m
//  APP
//
//  Created by BinGe on 2019/1/3.
//

#import "MinePresenter.h"
#import "MineViewHandler.h"

@implementation MinePresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[MineViewHandler alloc] initWithView:view];
    [self.handler setData:[[DataCenter get] userData]];
    [EventBus addObserver:self selector:@selector(loginStatusChanged:) event:EventLoginStatusChanged];
    return self;
}

- (void)loginStatusChanged:(UserData *)userData {
    [self.handler setData:userData];
}

@end
