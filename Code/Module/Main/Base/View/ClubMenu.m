//
//  ClubMenu.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClubMenu.h"

@interface ClubMenu()<DropDownMenuDelegate>

@end

@implementation ClubMenu

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 32) andDropdownViewHeight:700];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)didMenuItemSelectSelete:(DropdownMenuItem *)item {
    if (item.data) {
        
    }
}

- (void)setMenuData:(Data *)data {
    NSArray *area = [self areaMenu:data];
    NSArray *classify = [self classifyMenu:data];
    NSArray *sort = [self sortMenu:data];
    if (area && area.count && classify && classify.count && sort && sort.count) {
         self.menuItems = @[area,classify,sort];
    }
   
}

- (NSArray *)areaMenu:(Data *)data {
    NSMutableArray *menu = [NSMutableArray new];
    NSArray *area = [data arrayWithKey:@"areaList"];
    for (Data *itemData in area) {
        NSString *name = [itemData stringWithKey:@"areaName"];
        NSString *itemId = [itemData stringWithKey:@"areaId"];
        DropdownMenuItem *item  = [[DropdownMenuItem alloc] initWithID:itemId name:name];
        NSArray *childItems = [itemData arrayWithKey:@"rangeList"];
        NSMutableArray *array = [NSMutableArray new];
        for (Data *child in childItems) {
            NSString *name = [child stringWithKey:@"placeName"];
            NSString *itemId = [child stringWithKey:@"id"];
            DropdownMenuItem *itemChild  = [[DropdownMenuItem alloc] initWithID:itemId name:name];
            itemChild.data = child;
            [array addObject:itemChild];
        }
        item.childItems = array;
        [menu addObject:item];
    }
    return menu;
}

- (NSArray *)classifyMenu:(Data *)data {
    NSMutableArray *menu = [NSMutableArray new];
    NSArray *classify = [data arrayWithKey:@"categoryList"];
    for (Data *itemData in classify) {
        NSString *name = [itemData stringWithKey:@"name"];
        NSString *itemId = [itemData stringWithKey:@"id"];
        DropdownMenuItem *item  = [[DropdownMenuItem alloc] initWithID:itemId name:name];
        item.data = itemData;
        [menu addObject:item];
    }
    return menu;
}

- (NSArray *)sortMenu:(Data *)data {
    NSMutableArray *menu = [NSMutableArray new];
    NSArray *classify = [data arrayWithKey:@"sortList"];
    for (Data *itemData in classify) {
        NSString *name = [itemData stringWithKey:@"name"];
        NSString *itemId = [itemData stringWithKey:@"id"];
        DropdownMenuItem *item  = [[DropdownMenuItem alloc] initWithID:itemId name:name];
        item.data = itemData;
        [menu addObject:item];
    }
    return menu;
}



@end
