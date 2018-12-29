//
//  ViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "MVPViewController.h"

@implementation MVPViewController

+ (void)pushMVPControllerName:(NSString *)controllerName animated:(BOOL)animated data:(id)data {
    [MVPViewController pushMVPControllerClass:NSClassFromString(controllerName) animated:animated data:data];
}

+ (void)pushMVPControllerClass:(Class)controllerClass animated:(BOOL)animated data:(id __nullable)data {
    MVPViewController *vc = [[controllerClass alloc] init];
    vc.intentData = data;
    UIViewController *topController = [UIViewController topViewController];
    [topController.navigationController pushViewController:vc animated:animated];
}

+ (void)presentMVPControllerName:(NSString *)controllerName animated:(BOOL)animated data:(id __nullable)data completion:(void(^ __nullable)(void))completion {
    [MVPViewController presentMVPControllerClass:NSClassFromString(controllerName) animated:animated data:nil completion:completion];
}
+ (void)presentMVPControllerClass:(Class)controllerClass animated:(BOOL)animated data:(id __nullable)data completion:(void(^ __nullable)(void))completion {
    MVPViewController *vc = [[controllerClass alloc] init];
    vc.intentData = data;
    
    UIViewController *topController = [UIViewController topViewController];
    [topController presentViewController:vc animated:animated completion:completion];
}


@end
