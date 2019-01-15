//
//  TestViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "TestViewController.h"
#import "SecondViewController.h"
#import "SearchController.h"
#import "TestTableViewCell.h"

@interface NotificationLogin : NSObject



@end

@interface TestViewController ()
@property (nonatomic, strong) DropdownMenu *menu;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *token = [Store valueForKey:@"token" defaultValue:@""];
    [DataCenter perform:OperationLoginCheck params:token callback:^(id  _Nonnull operation, id  _Nullable data) {
        if ([data isKindOfClass:[UserData class]] && [data isLogin]) {
            NSDictionary *test = [Store valueForKey:@"test_data" defaultValue:nil];
            ClubData *club = [ClubData withDictionary:test];
            [UIViewController pushController:@"PublicCommentController" animated:YES data:club];
        } else {
            [UIViewController presentController:@"LoginViewController" animated:NO data:nil completion:nil];
        }
    }];
    
//    [self setContentViewWithXML:@"Test.xml"];
//    UITableView *tableView = [self findViewByName:@"table"];
//    AutoTableViewSection *section = [AutoTableViewSection sectionWithCellClass:[TestTableViewCell class] dataSource:@[@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120",@"130",@"140",@"150",@"160",@"170",@"180",@"190",@"200",@"210",@"220",@"230",@"240",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120",@"130",@"140",@"150",@"160",@"170",@"180",@"190",@"200",@"210",@"220",@"230",@"240",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120",@"130",@"140",@"150",@"160",@"170",@"180",@"190",@"200",@"210",@"220",@"230",@"240",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120",@"130",@"140",@"150",@"160",@"170",@"180",@"190",@"200",@"210",@"220",@"230",@"240",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120",@"130",@"140",@"150",@"160",@"170",@"180",@"190",@"200",@"210",@"220",@"230",@"240",@"50",@"60",@"70",@"80",@"90",@"100",@"110",@"120",@"130",@"140",@"150",@"160",@"170",@"180",@"190",@"200",@"210",@"220",@"230",@"240"]];
//    [tableView addSection:section];
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
