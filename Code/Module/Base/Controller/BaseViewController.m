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



@end
