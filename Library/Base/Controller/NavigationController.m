//
//  BaseNavigationController.m
//  YDD
//
//  Created by BinGe on 2018/12/6.
//

#import "NavigationController.h"

@implementation NavigationController
static bool set;
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!set) {
        UIImage *source = [UIImage imageNamed:@"back.png"];
        NSData *data = UIImagePNGRepresentation(source);
        UIImage *image = [UIImage imageWithData:data scale:2];
        [UINavigationBar appearance].backIndicatorTransitionMaskImage = image;
        [UINavigationBar appearance].backIndicatorImage = image;
        set = true;
    }

}

@end
