//
//  PublicCommentPresenter.m
//  APP
//
//  Created by BinGe on 2019/1/14.
//

#import "PublicCommentPresenter.h"
#import "PublicCommentViewHandler.h"

@interface PublicCommentPresenter()<ViewHandlerDelegate>

@end

@implementation PublicCommentPresenter

- (instancetype)initWithView:(UIView *)view {
    self = [super initWithView:view];

    self.handler = [[PublicCommentViewHandler alloc] initWithView:view];
    self.handler.delegate = self;
    return self;
}

- (void)onViewAction:(id)action data:(id)data {
    UIViewController *vc = [self.handler.view currentViewController];
    if ([action isEqualToString:@"action_search"]) {
        NSDictionary *params = @{@"club":vc.intentData,
                                 @"tech":data
                                 };
        WeakSelf(self)
        [DataCenter perform:OperationGetClubTechListData params:params callback:^(id  _Nonnull operation, Data * _Nullable data) {
            if (data.isSuccess) {
                PublicCommentViewHandler *handler = (PublicCommentViewHandler *)weakself.handler;
                [handler setTechList:(ListData *)data];
            }
        }];
    }
    else if ([action isEqualToString:@"action_upload"]) {
        NSArray *photos = data;
        for (UIImage *img in photos) {
            WeakSelf(self)
            [DataCenter perform:OperationUploadData params:img callback:^(id  _Nonnull operation, Data * _Nullable data) {
                PublicCommentViewHandler *handler = (PublicCommentViewHandler *)weakself.handler;
                [handler uploadResponse:data];
            }];
        }
    }
}

@end
