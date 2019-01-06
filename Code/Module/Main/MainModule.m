//
//  MainModule.m
//  APP
//
//  Created by BinGe on 2018/12/21.
//

#import "MainModule.h"
#import "MainTabbarController.h"
#import "MainNavigationController.h"

#import "HomeModule.h"

@interface MainModule()

@property (nonatomic, strong) HomeModule *homeModule;

@end

@implementation MainModule

- (instancetype)init {
    self = [super init];
    self.homeModule = [HomeModule new];
    return self;
}

- (void)setup:(BuildConfiguration)buildConfiguration {
    AppDelegate *app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    app.window.backgroundColor = [UIColor whiteColor];
    MainTabbarController *nv = [[MainTabbarController alloc] init];
    app.window.rootViewController = nv;
    [app.window makeKeyAndVisible];
    
    [self.homeModule setup:buildConfiguration];
}

- (void)getConfigurationFromServer {
    //LaunModule在setup之后会一起停留在启动页，直接收到App启动完成才会显示关闭启动页。
    [DataCenter perform:OperationGetConfig params:nil callback:^(id  _Nonnull operation, Data *  _Nullable data) {
        [self getConfigurationCompleted:(ConfigData *)data];
        [self.homeModule prepareGetHomeData];
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
                UIImage *nornal, *selected;
                if ([NSString isEmpty:data.imageNormal]) {
                    nornal = [UIImage imageNamed:[tabDic objectForKey:@"icon_normal"]];
                } else {
                    nornal = [UIImage imageWithURL:[NSURL URLWithString:data.imageNormal]];
                }
                if ((!data.imageSelected) || ([data.imageSelected isEqualToString:@""])) {
                    selected = [UIImage imageNamed:[tabDic objectForKey:@"icon_selected"]];
                } else {
                    selected = [UIImage imageWithURL:[NSURL URLWithString:data.imageSelected]];
                }
                UIColor *cNormal = [ColorUtils colorWithString:data.titleColorNormal];
                UIColor *cSelected = [ColorUtils colorWithString:data.titleColorSelected];
                
                NSString *controllerName = [tabDic objectForKey:@"controller"];
                Class cls = NSClassFromString(controllerName);
                UIViewController *vc = [[cls alloc] init];
                MainNavigationController *nv = [[MainNavigationController alloc] initWithRootViewController:vc];
//                nv.navigationBar.topItem.title = data.titleComponent.title;
                
                CGFloat scale = nornal.scale / 2.0;
                nornal = [ImageUtils scaleImage:nornal toScale:scale];
                selected = [ImageUtils scaleImage:selected toScale:scale];
                
                [main addTab:data.title selectedColor:cSelected unselectedColor:cNormal selectedImage:selected unselectedImage:nornal controller:nv];
            }
        }
    }
    
//#warning TODO 调试
//    main.selectedIndex = 3;
}


@end
