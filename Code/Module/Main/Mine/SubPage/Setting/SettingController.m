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
    
    SelectorItem *feedback = (SelectorItem *)[self findViewByName:@"selector_feedback"];
    [feedback setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"FeedbackController" animated:YES data:nil];
    }];
    
    SelectorItem *contact = (SelectorItem *)[self findViewByName:@"selector_contact"];
    [contact setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"ContactController" animated:YES data:nil];
    }];
    
    SelectorItem *about = (SelectorItem *)[self findViewByName:@"selector_about"];
    [about setItemClickBlock:^(id  _Nonnull target) {
        [UIViewController pushController:@"AboutController" animated:YES data:nil];
    }];
}



@end
