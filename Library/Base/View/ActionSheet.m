//
//  ActionSheet.m
//  APP
//
//  Created by BinGe on 2019/1/16.
//

#import "ActionSheet.h"

@interface ActionSheet()

@property (nonatomic, strong) UIAlertController *alertController;

@end

@implementation ActionSheet

- (instancetype)init {
    return [self initWithTitle:nil message:nil];
}
- (instancetype)initWithTitle:( NSString * _Nullable)title {
    return [self initWithTitle:nil message:nil];
}
- (instancetype)initWithTitle:( NSString * _Nullable)title message:(NSString *_Nullable)message {
    self = [super init];
    self.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    return self;
}

- (void)addItem:(NSString *)items block:(void(^)(void))block {
    id aaBlock = ^ (UIAlertAction *action) {
        if (block) {
            block();
        }
    };
    UIAlertAction *action = [UIAlertAction actionWithTitle:items style:UIAlertActionStyleDefault handler:aaBlock];
    [action setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [self.alertController addAction:action];
}

- (void)show {
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [cancel setValue:[UIColor blackColor] forKey:@"titleTextColor"];
    [self.alertController addAction:cancel];
    [[UIViewController topViewController] presentViewController:self.alertController animated:YES completion:^{
        
    }];
}

@end
