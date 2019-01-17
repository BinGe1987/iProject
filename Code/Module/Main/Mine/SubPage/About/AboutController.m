//
//  AboutController.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "AboutController.h"

@interface AboutController ()

@end

@implementation AboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = AppInfo.DisplayName;
    [self setContentViewWithXML:@"AboutController.xml"];
}

@end
