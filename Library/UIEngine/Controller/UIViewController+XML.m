//
//  UIViewController+XML.m
//  APP
//
//  Created by BinGe on 2018/12/29.
//

#import "UIViewController+XML.h"
#import "XMLModel.h"

@implementation UIViewController (XML)

- (void)setContentViewWithXML:(NSString *)xml {
    XMLModel *model = [[XMLModel alloc] initWithXML:xml];
    ViewGroup *vg = (ViewGroup *)[[UIEngine get]parse:model];
    [self setContentView:vg];
}

@end
