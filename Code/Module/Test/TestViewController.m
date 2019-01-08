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
    
    NSString *token = [Store valueForKey:@"token" defaultValue:@""];
    [DataCenter perform:OperationLoginCheck params:token callback:^(id  _Nonnull operation, id  _Nullable data) {
        if (![data isSuccess]) {
            [UIViewController presentController:@"LoginViewController" animated:NO data:nil completion:nil];
            
        } else {
            NSDictionary *testData = [Store valueForKey:@"test_data"];
            ClubData *club = [ClubData withDictionary:testData];
            [UIViewController pushController:@"ClubDetailController" animated:YES data:club];
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
