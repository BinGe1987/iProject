//
//  ProgressHUB+Utils.m
//  APP
//
//  Created by BinGe on 2018/12/30.
//

#import "ProgressHUB+Utils.h"
#import "MBProgressHUD.h"

@implementation ProgressHUB (Utils)

+ (void)loading {
    [MBProgressHUD showHUDAddedTo:TOP_WINDOW animated:YES];
    
}
+ (void)loadingTitle:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:TOP_WINDOW animated:YES];
    hud.label.text = title;
}
+ (void)loadingTitle:(NSString *)title detailText:(NSString *)detail{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:TOP_WINDOW animated:YES];
    hud.label.text = title;
    hud.detailsLabel.text = detail;
}

+ (void)showView:(UIView *)view {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[ImageUtils imageWithColor:[UIColor whiteColor] size:view.bounds.size]];
    [imageView addSubview:view];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:TOP_WINDOW animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = imageView;
    hud.minSize = view.frame.size;
    hud.margin = 0;
}

+ (void)dismiss {
    [MBProgressHUD hideHUDForView:TOP_WINDOW animated:YES];
}


@end
