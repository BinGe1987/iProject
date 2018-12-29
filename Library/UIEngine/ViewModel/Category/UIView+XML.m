//
//  UIView+XML.m
//  APP
//
//  Created by BinGe on 2018/12/29.
//

#import "UIView+XML.h"
#import "XMLModel.h"

@implementation UIView (XML)

+ (UIView *)viewWithXML:(NSString *)name size:(CGSize)size {
    
    XMLModel *model = [[XMLModel alloc] initWithXML:name];
    ViewGroup *vg = (ViewGroup *)[[UIEngine get]parse:model];
    [vg layoutWithMaxWidth:size.width maxHeight:size.height completed:nil];
    vg.frame = CGRectMake(0, 0, size.width, size.height);
    return vg;
    
    return nil;
}

@end
