//
//  DiscoverNvPresenter.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "Presenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverNvPresenter : Presenter<ViewPagerDelegate>

- (void)viewPager:(id)viewPager pageIndexDidChanged:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
