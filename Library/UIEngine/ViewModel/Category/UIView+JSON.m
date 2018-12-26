//
//  UIView+JSON.m
//  APP
//
//  Created by BinGe on 2018/12/26.
//

#import "UIView+JSON.h"

@implementation UIView (JSON)

+ (UIView *)viewWithJSON:(NSString *)name size:(CGSize)size {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    JSON *json = [[JSON alloc] initWithPath:path];
    JSONModel *model = [[JSONModel alloc] initWithJSON:json.source];
    ViewGroup *vg = (ViewGroup *)[[UIEngine get]parse:model];
    [vg layoutWithMaxWidth:size.width maxHeight:size.height completed:nil];
    vg.frame = CGRectMake(0, 0, size.width, size.height);
    return vg;
}

@end
