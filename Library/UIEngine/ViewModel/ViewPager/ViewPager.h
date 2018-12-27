//
//  ViewPager.h
//  APP
//
//  Created by BinGe on 2018/12/27.
//

#import "ViewGroup.h"
#import "ViewPagerParams.h"
#import "ViewPagerLayoutParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewPager : ViewGroup

- (void)addPage:(UIView *)page;

@end

NS_ASSUME_NONNULL_END
