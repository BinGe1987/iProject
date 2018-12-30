//
//  LoginPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "LoginPresenter.h"
#import "LoginViewHandler.h"

@implementation LoginPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[LoginViewHandler alloc] initWithView:view];
    
    return self;
}

@end
