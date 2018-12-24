//
//  MainModule.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "MainModule.h"
#import "MainTabbarController.h"
#import "MainNavigationController.h"

@implementation MainModule

- (void)setup:(BuildConfiguration)buildConfiguration {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    app.window.backgroundColor = [UIColor whiteColor];
    MainTabbarController *nv = [[MainTabbarController alloc] init];
    app.window.rootViewController = nv;
    [app.window makeKeyAndVisible];
}

- (void)getConfigurationFromServer {
    //LaunModule在setup之后会一起停留在启动页，直接收到App启动完成才会显示关闭启动页。
    [DataCenter perform:OperationGetConfig params:nil callback:^(id  _Nonnull operation, id  _Nullable data) {
        [self getConfigurationCompleted:data];
    }];
}

- (void)getConfigurationCompleted:(ConfigData *)config {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"TabMapping" ofType:@"xml"];
    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLFile:filePath];
    
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    MainTabbarController *main = (MainTabbarController *)app.window.rootViewController;
    
    for (TabData *data in config.tabArray) {
        NSString *type = data.type;

        for (NSDictionary *tabDic in [xmlDoc objectForKey:@"tab"]) {
            if ([type isEqualToString:[tabDic objectForKey:@"type"]]) {
                
                NSString *controllerName = [tabDic objectForKey:@"controller"];
                Class cls = NSClassFromString(controllerName);
                UIViewController *vc = [[cls alloc] init];
                UIImage *nornal, *selected;
                if ((!data.imageNormal) || ([data.imageNormal isEqualToString:@""])) {
                    nornal = [UIImage imageNamed:[tabDic objectForKey:@"icon_normal"]];
                } else {
                    
                }
                if ((!data.imageSelected) || ([data.imageSelected isEqualToString:@""])) {
                    selected = [UIImage imageNamed:[tabDic objectForKey:@"icon_selected"]];
                } else {
                    
                }
                UIColor *cNormal = [UIColor colorWithString:data.titleColorNormal];
                UIColor *cSelected = [UIColor colorWithString:data.titleColorSelected];
                [main addTab:data.title selectedColor:cSelected unselectedColor:cNormal selectedImage:selected unselectedImage:nornal controller:vc];
            }
        }
    }
}


@end
