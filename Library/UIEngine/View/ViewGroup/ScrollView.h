//
//  ScrollView.h
//  APP
//
//  Created by BinGe on 2018/12/12.
//

#import "ViewGroup.h"
#import "ScrollViewParams.h"
#import "ScrollLayoutParams.h"

#define IsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define TabBarHeight        (IsiPhoneX ? 83 : 49)
#define NavBarHeight        (IsiPhoneX ? 88 : 64)

// ScrollView的适配
#define ADJUSTS_SCROLLVIEW_INSETS_NO(scrollView, vc)\
vc.extendedLayoutIncludesOpaqueBars = YES;\
scrollView.contentInset = UIEdgeInsetsMake(NavBarHeight, 0, TabBarHeight, 0);\
scrollView.scrollIndicatorInsets = scrollView.contentInset;\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if (@available(iOS 11.0, *)) {\
scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop")\
} while (0)


NS_ASSUME_NONNULL_BEGIN

@interface ScrollView : UIScrollView<ViewGroupDelegate>

//滑动布局的方向
@property (nonatomic, assign) ScrollOrientation orientation;

@end

NS_ASSUME_NONNULL_END
