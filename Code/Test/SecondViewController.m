//
//  SecondViewController.m
//  APP
//
//  Created by BinGe on 2018/12/20.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test.json" ofType:nil];
    [self setContentViewWithJSONPath:path];
    
    NetStatus status = [Net networkStatus];
    Log(@"NetStatus %ld", (long)status);
    [Net addNetworkObserver:self selector:@selector(netChangedLisenter:)];
    
    UIButton *btn2 = (UIButton *)[self findViewByName:@"btn2"];
    [btn2 setClickBlock:^(UIButton * _Nonnull button) {
        [EventBus postEvent:@"abc" data:@"456"];
    }];
    [EventBus addObserver:self selector:@selector(test:) event:@"abc"];
}

- (void)test:(id)data {
    Log(@"SecondViewController %@",data);
}

- (void)netChangedLisenter:(id)status {
    //    NetStatus status = [Net networkStatus];
    Log(@"NetStatus %ld", (long)status);
}

- (void)dealloc
{
    Log(@"removeNetworkObserver");
    [Net removeNetworkObserver:self];
}

@end
