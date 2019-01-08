//
//  ClassifyViewController.m
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "ClassifyViewController.h"
#import "ClassifyPresenter.h"

@interface ClassifyViewController ()

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setContentViewWithXML:@"ClassifyViewController.xml"];
    
    [self addPresenter:[[ClassifyPresenter alloc] initWithView:self.contentView]];
}

@end
