//
//  SettingController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "SettingController.h"
#import "SelectorItem.h"

@interface SettingController ()

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self setContentViewWithXML:@"SettingController.xml"];
    
    SelectorItem *item = (SelectorItem *)[self findViewByName:@"selector_profile"];
    [item setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"ProfileEditController" animated:YES data:nil];
    }];
}



@end
