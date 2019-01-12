//
//  SearchPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/12.
//

#import "SearchPresenter.h"
#import "SearchNavigationViewHandler.h"
#import "SearchViewHandler.h"
#import "SearchResultViewHandler.h"

@interface SearchPresenter()<ViewHandlerDelegate>

@property (nonatomic, strong) SearchNavigationViewHandler *nvHandler;
@property (nonatomic, strong) SearchViewHandler *searchHandler;
@property (nonatomic, strong) SearchResultViewHandler *resultHandler;

@end

@implementation SearchPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
    UIViewController *vc = [view currentViewController];
    self.nvHandler = [[SearchNavigationViewHandler alloc] initWithView:vc.navigationView];
    self.nvHandler.delegate = self;
    self.searchHandler = [[SearchViewHandler alloc] initWithView:[view findViewByName:@"layout_search"]];
    self.searchHandler.delegate = self;
    self.resultHandler = [[SearchResultViewHandler alloc] initWithView: [view findViewByName:@"table"]];
    self.resultHandler.delegate = self;
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    
}



@end
