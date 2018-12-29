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
    TICK
    XMLModel *model = [[XMLModel alloc] initWithXML:xml];
    ViewGroup *vg = (ViewGroup *)[[UIEngine get]parse:model];
    TOCK
    
    [self setContentView:vg];
}

@end
