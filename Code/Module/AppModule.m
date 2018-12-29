//
//  AppModule.m
//  APP
//
//  Created by BinGe on 2018/12/22.
//

#import "AppModule.h"
#import "GlobalModule.h"
#import "MainModule.h"
#import "LaunchModule.h"
#import "LoginModule.h"
#import "LoginViewController.h"

@interface AppModule()

@property (nonatomic, strong) GlobalModule  *global;
@property (nonatomic, strong) MainModule    *main;
@property (nonatomic, strong) LaunchModule  *launch;
@property (nonatomic, strong) LoginModule   *login;

@end

@implementation AppModule

- (instancetype)init {
    self = [super init];
    if (self) {
        self.global = [GlobalModule new];
        self.main   = [MainModule   new];
        self.launch = [LaunchModule new];
        self.login  = [LoginModule  new];
    }
    return self;
}

- (void)setup:(BuildConfiguration)buildConfiguration {
    
    //LaunModule在setup之后会一起停留在启动页，直接收到App启动完成才会显示关闭启动页。
    [self.global    setup:buildConfiguration];
    [self.main      setup:buildConfiguration];
    [self.launch    setup:buildConfiguration];
    [self.login     setup:buildConfiguration];
    
    //module之前没有关联，通过hook所有Module的方法，来实现Module之前的关联关系
    [self hookModuleActions];
}

- (void)hookModuleActions {
    WeakSelf(self)
    //hook自动登录完成
    [self.login hookAfterSelector:@selector(loginCheckCompleted) block:^(id info) {
//        Log(@"AppModule: hook自动登录完成");
        [weakself.main getConfigurationFromServer];
        //hook获取配置信息完成
        [weakself.main hookAfterSelector:@selector(getConfigurationCompleted:) block:^() {
//            Log(@"AppModule: hook获取配置信息完成");
            
            //启动页退出动画
            [weakself.launch finishAnimated];
            //hook启动页动画结束
            [weakself.launch hookAfterSelector:@selector(launchCompleted) block:^() {
//                Log(@"AppModule: hook启动页动画结束");
                
            }];
            
        }];
    }];
}

@end
