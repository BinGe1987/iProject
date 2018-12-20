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
    
}

- (void)netChangedLisenter:(id)status {
    //    NetStatus status = [Net networkStatus];
    Log(@"NetStatus %ld", (long)status);
}

- (void)dealloc
{
    Log(@"removeNetworkObserver");
//    [Net removeNetworkObserver:self];
}

@end
