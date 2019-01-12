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
    
//    [self onViewAction:@"action_search" data:@"小"];
    
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    if ([action isEqualToString:@"action_search"]) {
//        [self.resultHandler search:data];
        if ([NSString isEmpty:data]) {
            [self.resultHandler show:NO];
        } else {
            WeakSelf(self)
            [self.resultHandler show:YES];
            [DataCenter perform:OperationGetClubSearchData params:@{@"search":data} callback:^(id  _Nonnull operation, Data * _Nullable data) {
                [weakself.resultHandler setData:data];
            }];
        }
    }
    else if ([action isEqualToString:@"action_search_text"]) {
        [self.nvHandler setSearchText:data];
    }
    else if ([action isEqualToString:@"action_search_history_changed"]) {
        [self.searchHandler refreshHistoryList];
    }
}



@end
