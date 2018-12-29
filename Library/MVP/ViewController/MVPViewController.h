//
//  ViewController.h
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "PresenterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVPViewController : PresenterViewController

+ (void)pushMVPControllerName:(NSString *)controllerName animated:(BOOL)animated data:(id __nullable)data;
+ (void)pushMVPControllerClass:(Class)controllerClass animated:(BOOL)animated data:(id __nullable)data;

+ (void)presentMVPControllerName:(NSString *)controllerName animated:(BOOL)animated data:(id __nullable)data completion:(void(^ __nullable)(void))completion;
+ (void)presentMVPControllerClass:(Class)controllerClass animated:(BOOL)animated data:(id __nullable)data completion:(void(^ __nullable)(void))completion;


@end

NS_ASSUME_NONNULL_END
