//
//  TestViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "TestViewController.h"
#import "SecondViewController.h"

@interface NotificationLogin : NSObject



@end

@interface TestViewController ()
@property (nonatomic, strong) DropdownMenu *menu;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test.json" ofType:nil];
//    [self setContentViewWithJSONPath:path];
//
//    WeakSelf(self)
//    UIButton *btn1 = (UIButton *)[self findViewByName:@"btn1"];
//    [btn1 setClickBlock:^(UIButton * _Nonnull button) {
//        [weakself.navigationController pushViewController:[SecondViewController new] animated:YES];
//    }];
//    UIButton *btn2 = (UIButton *)[self findViewByName:@"btn2"];
//    [btn2 setClickBlock:^(UIButton * _Nonnull button) {
//         [EventBus postEvent:@"abc" data:@"456"];
//    }];
//    [EventBus addObserver:self selector:@selector(test:) event:@"abc"];
    
//    NSString *a = AppInfo.BundleIdentifier;
//    NSString *b = AppInfo.Build;
//    NSString *c = AppInfo.DisplayName;
//    NSString *d = AppInfo.Version;
//    NSString *e = AppInfo.Device;
//    NSString *f = AppInfo.SystemVersion;
//    NSString *g = AppInfo.UUID;
    
//    [SecondViewController hookAfterSelector:@selector(abc:cba:) block:^(id arg1, id arg2, id arg3) {
//
//    }];
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 414, 106)];
//    view.backgroundColor = [UIColor redColor];
//    UIView *subView = [UIView viewWithJSON:@"Discover.json" size:view.bounds.size];
//    [view addSubview:subView];
//    [self.view addSubview:view];

//    [self setContentViewWithJSONFileName:@"Discover.json"];

    TICK
//    UIView *view = [UIView viewWithXML:@"Login.xml" size:CGSizeMake(SCREENWIDTH, SCREENHEIGHT)];
//    [self.view addSubview:view];
    TOCK
    
    self.menu = [[DropdownMenu alloc] initWithFrame:self.view.bounds];
    DropdownMenuItem *item11  = [[DropdownMenuItem alloc] initWithID:1 name:@"123"];
    DropdownMenuItem *item12  = [[DropdownMenuItem alloc] initWithID:1 name:@"456"];
    DropdownMenuItem *item13  = [[DropdownMenuItem alloc] initWithID:1 name:@"789"];
    NSArray *item1 = @[item11,item12, item13];
    
    DropdownMenuItem *itema1  = [[DropdownMenuItem alloc] initWithID:1 name:@"itema1"];
    DropdownMenuItem *itema2  = [[DropdownMenuItem alloc] initWithID:1 name:@"itema2"];
    DropdownMenuItem *itema3  = [[DropdownMenuItem alloc] initWithID:1 name:@"itema3"];
    item11.childItems = @[itema1,itema2,itema3];
    
//    DropdownMenuItem *item2  = [[DropdownMenuItem alloc] initWithID:2 name:@"456"];
//    DropdownMenuItem *item3  = [[DropdownMenuItem alloc] initWithID:3 name:@"789"];
    
    self.menu.menuItems = @[item1,item1,item1];
    
    [self.view addSubview:self.menu];
    
}


- (void)test:(id)data {
    Log(@"TestViewController %@",data);
}

- (void)onLayoutSubViewsCompleted {
    CGFloat height = STATUSBARHIEGHT + NVBARHIEGHT;
    ScrollView *sv = (ScrollView *)[self findViewByName:@"scroll_view"];
    sv.contentInset = UIEdgeInsetsMake(height,0,0,0);
    sv.contentOffset = CGPointMake(0, -height);
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    insets.bottom = self.tabBarController.tabBar.frame.size.height;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height);
}

@end
