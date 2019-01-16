//
//  NiceNameEditController.m
//  APP
//
//  Created by BinGe on 2019/1/16.
//

#import "NiceNameEditController.h"

@interface NiceNameEditController ()

@end

@implementation NiceNameEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改昵称";
    
    [self setContentViewWithXML:@"NiceNameEditController.xml"];
}

@end
