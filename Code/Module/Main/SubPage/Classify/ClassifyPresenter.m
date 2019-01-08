//
//  ClassifyPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClassifyPresenter.h"
#import "ClassifyMenuViewHandler.h"

@interface ClassifyPresenter()

@property (nonatomic, strong) ClassifyMenuViewHandler *menuHandler;


@end

@implementation ClassifyPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    self.menuHandler = [[ClassifyMenuViewHandler alloc] initWithView:view];
    
    return self;
}

@end
