//
//  DiscoverClubPresenter.m
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "DiscoverClubPresenter.h"
#import "DiscoverClubViewHandler.h"

@interface DiscoverClubPresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) DropdownMenu *menu;

@end


@implementation DiscoverClubPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    self.handler = [[DiscoverClubViewHandler alloc] initWithView:[view findViewByName:@"table"]];
    self.handler.delegate = self;
    
    
    [self addMenu:[view findViewByName:@"layout_menu"]];
    
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetDiscoverClubData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
    
    
    return self;
}

- (void)addMenu:(UIView *)parentView {
    DropdownMenu *menu = [[DropdownMenu alloc] initWithFrame:CGRectMake(0, 90, SCREENWIDTH, 30) andDropdownViewHeight:400];
    DropdownMenuItem *item11  = [[DropdownMenuItem alloc] initWithID:1 name:@"附近"];
    DropdownMenuItem *item12  = [[DropdownMenuItem alloc] initWithID:1 name:@"456"];
    DropdownMenuItem *item13  = [[DropdownMenuItem alloc] initWithID:1 name:@"789"];
    NSArray *item1 = @[item11,item12, item13];
    
    DropdownMenuItem *itema1  = [[DropdownMenuItem alloc] initWithID:1 name:@"itema1"];
    DropdownMenuItem *itema2  = [[DropdownMenuItem alloc] initWithID:1 name:@"itema2"];
    DropdownMenuItem *itema3  = [[DropdownMenuItem alloc] initWithID:1 name:@"itema3"];
    
    item11.childItems = @[itema1,itema2,itema3,itema1,itema2,itema3];
    item13.childItems = @[itema1,itema2,itema3];
    
    DropdownMenuItem *item21  = [[DropdownMenuItem alloc] initWithID:1 name:@"全部分类"];
    DropdownMenuItem *item22  = [[DropdownMenuItem alloc] initWithID:1 name:@"456"];
    DropdownMenuItem *item23  = [[DropdownMenuItem alloc] initWithID:1 name:@"789"];
    NSArray *item2 = @[item21,item22, item23,item21,item22, item23,item21,item22, item23,item21,item22, item23,item21,item22, item23];
    menu.menuItems = @[item1,item2,item2];
    
    //
    ViewParams *vp = [ViewParams new];
    vp.widthValueType = FULL;
    vp.heightValueType = FULL;
    menu.viewParams = vp;
    [parentView addSubview:menu];
}

- (void)onViewAction:(id)action {
    WeakSelf(self)
    [[DataCenter get] perform:OperationGetHomeData params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [weakself.handler setData:data];
    }];
}

@end
