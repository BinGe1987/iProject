//
//  YDDController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这两句实现的效果是当NavigationBar为不透明时坐标可以从0，0开始，而不是从NavigationBar下方开始算
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
}

//- (CGRect)safeRect {
//    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
//    UIEdgeInsets insets = self.view.safeAreaInsets;
//    insets.top = 0;
//    CGFloat width = size.width - insets.left - insets.right;
//    CGFloat height = size.height - insets.top - insets.bottom;
//    return CGRectMake(insets.left, insets.top, width, height);
//}

@end
