//
//  ContactController.m
//  APP
//
//  Created by BinGe on 2019/1/17.
//

#import "ContactController.h"

@interface ContactController ()

@end

@implementation ContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"联系客服";
    [self setContentViewWithXML:@"ContactController.xml"];
}

@end
