//
//  HomeNvViewHandler.m
//  APP
//
//  Created by BinGe on 2018/12/25.
//

#import "HomeNvViewHandler.h"

@implementation HomeNvViewHandler

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];
    
//    view.backgroundColor = [UIColor redColor];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HomeNavigation.json" ofType:nil];
    JSON *json = [[JSON alloc] initWithPath:path];
    if (!json.error) {
        JSONModel *model = [[JSONModel alloc] initWithJSON:json.source];
        ViewGroup *vg = (ViewGroup *)[[UIEngine get]parse:model];
//        vg.backgroundColor = [UIColor redColor];
        CGRect rect = view.frame;
        [vg layoutWithMaxWidth:view.bounds.size.width maxHeight:view.bounds.size.height completed:nil];
        vg.frame = rect;
        [view addSubview:vg];
    }
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame=CGRectMake(0,0, SCREENWIDTH - ScaleValue(93) - ScaleValue(69),ScaleValue(26));
    searchBar.layer.cornerRadius=12;
    searchBar.layer.masksToBounds=YES;
    [searchBar.layer setBorderWidth:0.5];
    [searchBar.layer setBorderColor: [[UIColor colorWithRed:46.0f/255.0f green:46.0f/255.0f blue:46.0f/255.0f alpha:1.0f] CGColor]];
    searchBar.placeholder = @"搜索一下附近吧...";
    searchBar.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height / 2);
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    if (searchField) {
        [searchField setValue:[UIColor colorWithRed:214.0f/255.0f green:214.0f/255.0f blue:214.0f/255.0f alpha:1.0f] forKeyPath:@"_placeholderLabel.textColor"];
        [searchField setValue:[UIFont fontWithName:@"PingFang-SC-Medium" size:13.0f] forKeyPath:@"_placeholderLabel.font"];
    }
    
    
    [view addSubview:searchBar];
    
    
    return self;
}

@end
