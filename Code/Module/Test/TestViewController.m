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
//    [Store setValue:@"f22c94425da84049a30ba1482cdeb2fc" forKey:@"token"];
    NSString *token = [Store valueForKey:@"token" defaultValue:@""];
    [DataCenter perform:OperationLoginCheck params:token callback:^(id  _Nonnull operation, id  _Nullable data) {
        if ([data isKindOfClass:[UserData class]] && [data isLogin]) {
            NSDictionary *test = [Store valueForKey:@"test_data" defaultValue:nil];
            ClubData *club = [ClubData withDictionary:test];
            [UIViewController pushController:@"ClubDetailController" animated:YES data:club];
//            [UIViewController pushController:@"NiceNameEditController" animated:YES data:nil];
        } else {
            NSLog(@"%@",data);
            [UIViewController presentController:@"LoginViewController" animated:NO data:nil completion:nil];
        }
    }];
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
