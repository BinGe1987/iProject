//
//  ViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "MVPViewController.h"

@implementation MVPViewController

+ (void)pushSelf {
    [MVPViewController pushMVPControllerName:@"MVPViewController"];
}
+ (void)pushMVPControllerName:(NSString *)controllerName {
    [MVPViewController pushMVPControllerClass:NSClassFromString(controllerName) animated:YES data:nil];
}
+ (void)pushMVPControllerName:(NSString *)controllerName data:(id)data {
    [MVPViewController pushMVPControllerClass:NSClassFromString(controllerName) animated:YES data:data];
}
+ (void)pushMVPControllerName:(NSString *)controllerName animated:(BOOL)animated data:(id)data {
    [MVPViewController pushMVPControllerClass:NSClassFromString(controllerName) animated:animated data:data];
}
+ (void)pushMVPControllerClass:(Class)controllerClass animated:(BOOL)animated data:(id __nullable)data {
    MVPViewController *vc = [[controllerClass alloc] init];
    vc.intentData = data;
    UIViewController *topController = [UIViewController topViewController];
    [topController.navigationController pushViewController:vc animated:animated];
}

+ (void)presentSelf {
    [MVPViewController presentMVPControllerName:@"MVPViewController"];
}
+ (void)presentMVPControllerName:(NSString *)controllerName {
    [MVPViewController presentMVPControllerName:controllerName animated:YES data:nil completion:nil];
}
+ (void)presentMVPControllerName:(NSString *)controllerName data:(id __nullable)data {
    [MVPViewController presentMVPControllerName:controllerName animated:YES data:data completion:nil];
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
