//
//  TabData.m
//  APP
//
//  Created by BinGe on 2018/12/24.
//

#import "TabData.h"

@implementation TabData

-(void)setData:(Data *)data {
    [super setData:data];
    
    self.type = [data stringWithKey:@"type"];
    
    self.tabID = [data integerWithKey:@"tabId"];
    self.title = [data stringWithKey:@"tabName"];
    
    self.titleColorNormal = [data stringWithKey:@"textColor" defaultValue:@"#ffffffff"];
    self.titleColorSelected = [data stringWithKey:@"selectedTextColor" defaultValue:@"#ffffffff"];
    
    self.imageNormal = [data stringWithKey:@"icon" defaultValue:nil];
    self.imageSelected= [data stringWithKey:@"selectedIcon" defaultValue:nil];
    
    if (![NSString isEmpty:self.imageNormal]) {
        [Net requestImageWithURL:[NSURL URLWithString:self.imageNormal]];
    }
    if (![NSString isEmpty:self.imageSelected]) {
        [Net requestImageWithURL:[NSURL URLWithString:self.imageSelected]];
    }
 
    self.titleComponent = [ComponentData withData:[self jsonWithKey:@"titleComponent"]];
}


@end
