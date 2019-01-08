//
//  ClubMenu.m
//  APP
//
//  Created by BinGe on 2019/1/8.
//

#import "ClubMenu.h"

@implementation ClubMenu

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 32) andDropdownViewHeight:500];
    if (self) {
        DropdownMenuItem *item11  = [[DropdownMenuItem alloc] initWithID:1 name:@"附近"];
        DropdownMenuItem *item12  = [[DropdownMenuItem alloc] initWithID:1 name:@"福田"];
        DropdownMenuItem *item13  = [[DropdownMenuItem alloc] initWithID:1 name:@"罗湖"];
        DropdownMenuItem *item14  = [[DropdownMenuItem alloc] initWithID:1 name:@"南山"];
        DropdownMenuItem *item15  = [[DropdownMenuItem alloc] initWithID:1 name:@"盐田"];
        DropdownMenuItem *item16  = [[DropdownMenuItem alloc] initWithID:1 name:@"宝安"];
        DropdownMenuItem *item17  = [[DropdownMenuItem alloc] initWithID:1 name:@"龙岗"];
        DropdownMenuItem *item18  = [[DropdownMenuItem alloc] initWithID:1 name:@"龙华新区"];
        DropdownMenuItem *item19  = [[DropdownMenuItem alloc] initWithID:1 name:@"坪山新区"];
        NSArray *item1 = @[item11,item12, item13, item14,item15,item16,item17,item18,item19];
        item11.childItems = @[[[DropdownMenuItem alloc] initWithID:1 name:@"全部"],
                              [[DropdownMenuItem alloc] initWithID:1 name:@"华强北"],
                              [[DropdownMenuItem alloc] initWithID:1 name:@"八卦岭/园岭"],
                              [[DropdownMenuItem alloc] initWithID:1 name:@"梅林"],
                              [[DropdownMenuItem alloc] initWithID:1 name:@"荔枝公园片区"],
                              [[DropdownMenuItem alloc] initWithID:1 name:@"中心城区"],
                              ];
        
        NSArray *item2 = @[[[DropdownMenuItem alloc] initWithID:1 name:@"全部分类"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"桑拿水疗"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"推拿按摩"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"养生沐足"],
                           ];
        NSArray *item3 = @[[[DropdownMenuItem alloc] initWithID:1 name:@"智能排序"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"离我最近"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"好评优先"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"人气优先"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"价格最底"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"价格最高"],
                           [[DropdownMenuItem alloc] initWithID:1 name:@"折扣最高"],
                           ];
        
        self.menuItems = @[item1,item2,item3];
    }
    return self;
}

@end
