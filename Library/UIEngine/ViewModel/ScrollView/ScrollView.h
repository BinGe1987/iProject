//
//  ScrollView.h
//  APP
//
//  Created by BinGe on 2018/12/12.
//

#import "ViewGroup.h"
#import "ScrollViewParams.h"
#import "ScrollLayoutParams.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScrollView : UIScrollView<ViewGroupDelegate, UIScrollViewDelegate>

//滑动布局的方向
@property (nonatomic, assign) ScrollOrientation orientation;

@end

NS_ASSUME_NONNULL_END
