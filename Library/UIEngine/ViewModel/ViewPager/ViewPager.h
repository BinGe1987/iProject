//
//  ViewPager.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "ScrollView.h"
#import "ViewPagerParams.h"
#import "ViewPagerLayoutParams.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ViewPagerDelegate <NSObject>

- (void)viewPager:(id)viewPager pageIndexDidChanged:(NSInteger)index;

@end

@interface ViewPager : ScrollView

@property (nonatomic, assign) id<ViewPagerDelegate> viewPagerDelegate;

- (UIView *)pageWithIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
