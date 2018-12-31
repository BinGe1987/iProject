//
//  DropdownMenu.m
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "DropdownMenu.h"
#import "DOPDropDownMenu.h"

@interface DropdownMenu ()<DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>

@property (nonatomic, weak) DOPDropDownMenu *menu;

@end

@implementation DropdownMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加下拉菜单
        DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
        [self addSubview:menu];
         _menu = menu;
    }
    return self;
}


- (void)setMenuItems:(NSArray *)menuItems {
    _menuItems = menuItems;
    //当下拉菜单收回时的回调，用于网络请求新的数据
    _menu.finishedBlock=^(DOPIndexPath *indexPath){
        if (indexPath.item >= 0) {
            NSLog(@"收起:点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
        }else {
            NSLog(@"收起:点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
        }
    };
    _menu.delegate = self;
    _menu.dataSource = self;
    [self menuReloadData];
}


- (void)menuReloadData
{
    [_menu reloadData];
    [_menu selectIndexPath:[DOPIndexPath indexPathWithCol:0 row:0 item:2]];
}

- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return self.menuItems.count;
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
//    if (column >= 0) {
//        DropdownMenuItem *item = self.menuItems[column];
//        return item.childItems.count;
//    }
//    if (column == 0) {
//        return self.classifys.count;
//    }else if (column == 1){
//        return self.areas.count;
//    }else {
//        return self.sorts.count;
//    }
    if (column >= 0) {
        NSArray *arr = self.menuItems[column];
        return arr.count;
    }
    return 0;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
//    DropdownMenuItem *item = self.menuItems[indexPath.column];
    NSArray *arr = self.menuItems[indexPath.column];
    DropdownMenuItem *item = arr[indexPath.row];
    return item.name;
//    if (indexPath.column == 0) {
//        return item.childItems[indexPath.row].name;
//    } else if (indexPath.column == 1){
//        return self.areas[indexPath.row];
//    } else {
//        return self.sorts[indexPath.row];
//    }
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    //    if (indexPath.column == 0 || indexPath.column == 1) {
    //        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.row];
    //    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu imageNameForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    //    if (indexPath.column == 0 && indexPath.item >= 0) {
    //        return [NSString stringWithFormat:@"ic_filter_category_%ld",indexPath.item];
    //    }
    return nil;
}

// new datasource

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.column < 2) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}

- (NSString *)menu:(DOPDropDownMenu *)menu detailTextForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
    return [@(arc4random()%1000) stringValue];
}

- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    NSArray *arr = self.menuItems[column];
    DropdownMenuItem *item = arr[row];
    return item.childItems.count;
}

- (NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
//    if (indexPath.column == 0) {
//        if (indexPath.row == 0) {
//            return self.cates[indexPath.item];
//        } else if (indexPath.row == 2){
//            return self.movices[indexPath.item];
//        } else if (indexPath.row == 3){
//            return self.hostels[indexPath.item];
//        }
//    }
    NSArray *arr = self.menuItems[indexPath.column];
    DropdownMenuItem *item = arr[indexPath.row];
    return item.childItems[indexPath.item].name;
    
//    return nil;
}

- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

- (DropdownMenuItem *)itemForIndexPath:(DOPIndexPath *)indexPath {
    NSArray *arr = self.menuItems[indexPath.column];
    DropdownMenuItem *item = arr[indexPath.row];
    return item;
}


@end
