//
//  DropdownMenuItem.m
//  APP
//
//  Created by BinGe on 2018/12/31.
//

#import "DropdownMenuItem.h"

@implementation DropdownMenuItem

- (instancetype)initWithID:(NSInteger)itemID name:(NSString *)name {
    return [self initWithID:itemID name:name icon:nil];
}

- (instancetype)initWithID:(NSInteger)itemID name:(NSString *)name icon:(UIImage * _Nullable)icon {
    self = [super init];
    self.itemID = itemID;
    self.name = name;
    self.icon = icon;
    return self;
}

@end
