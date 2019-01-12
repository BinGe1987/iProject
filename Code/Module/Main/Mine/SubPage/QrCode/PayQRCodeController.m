//
//  PayQRCodeController.m
//  APP
//
//  Created by BinGe on 2019/1/4.
//

#import "PayQRCodeController.h"

@implementation PayQRCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"向商家付钱";
    [self setContentViewWithXML:@"PayQRCodeController.xml"];
}

- (CGRect)safeRect {
    CGSize size = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    UIEdgeInsets insets = self.view.safeAreaInsets;
    insets.top = 0;
    CGFloat width = size.width - insets.left - insets.right;
    CGFloat height = size.height - insets.top - insets.bottom;
    return CGRectMake(insets.left, insets.top, width, height);
}

@end
