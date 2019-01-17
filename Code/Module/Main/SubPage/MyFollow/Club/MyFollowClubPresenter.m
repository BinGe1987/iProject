//
//  MyFollowClubPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "MyFollowClubPresenter.h"
#import "MyFollowClubViewHandler.h"

@interface MyFollowClubPresenter()<ViewHandlerDelegate>

@end

@implementation MyFollowClubPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.handler = [MyFollowClubViewHandler handlerWithView:view delgate:self];
    [self.handler setClubList:[ListData new]];
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    
}

@end
