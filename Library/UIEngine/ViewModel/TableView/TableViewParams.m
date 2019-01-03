//
//  TableViewParams.m
//  APP
//
//  Created by BinGe on 2018/12/19.
//

#import "TableViewParams.h"

@implementation TableViewParams

-(instancetype)initWithModel:(id<UIModel>)model {
    self = [super initWithModel:model];
    if (self) {
        NSString *scrollIndicator = [model getString:@"view_scrollIndicator" defaultValue:@"YES"];
        self.scrollIndicator = [scrollIndicator isEqualToString:@"YES"];
    }
    return self;
}

@end
