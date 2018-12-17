//
//  BaseTabBarController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "TabbarController.h"

@interface TabbarController()

@property (nonatomic, strong) NSMutableArray *tabs;

@end

@implementation TabbarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addTab:(NSString *)title image:(UIImage *)image controller:(UIViewController *)viewController
{
    [self addTab:title selectedImage:image unselectedImage:nil controller:viewController];
}

- (void)addTab:(NSString *)title selectedImage:(UIImage *)selected unselectedImage:(UIImage *)unselected controller:(UIViewController *)viewController
{
    [self addTab:title selectedColor:nil unselectedColor:nil selectedImage:selected unselectedImage:unselected controller:viewController];
}

- (void)addTab:(NSString *)title selectedColor:(UIColor * _Nullable)selectedColor unselectedColor:(UIColor * _Nullable)unselectedColor selectedImage:(UIImage *)selectedImage unselectedImage:(UIImage *)unselectedImage controller:(UIViewController *)viewController
{
//    NavigationController *nvc = [[NavigationController alloc] initWithRootViewController:viewController];
//    viewController.hidesBottomBarWhenPushed = NO;
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.title = title;
    
    /// 这里不设置UIImageRenderingModeAlwaysOriginal图片不会使用原始图标，系统会自动调整
    tabBarItem.image = [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ///设置选中与未选中的不同title 颜色
    unselectedColor ? [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectedColor} forState:UIControlStateNormal] : 0;
    selectedColor ? [tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:selectedColor} forState:UIControlStateSelected] : 0;
    
    viewController.tabBarItem = tabBarItem;
    
//    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:self.viewControllers];
//    [array addObject:nvc];
    [self.tabs addObject:viewController];
    self.viewControllers = self.tabs;
}



- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
