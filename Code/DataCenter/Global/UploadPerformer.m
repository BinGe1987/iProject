//
//  UploadPerformer.m
//  APP
//
//  Created by BinGe on 2019/1/15.
//

#import "UploadPerformer.h"

@implementation UploadPerformer

- (id)perform:(id)operation params:(id)params callback:(ICallback)callback {
    UIImage *image = params;
    HttpRequest *req = [HttpRequest withHost:[URLConstant host] api:@"/ydd-manager/api/v1/image/file/upload"];
    req.data = @{@"token":DataCenter.token,};
    req.uploadImage = image;
    HttpResponse *resp = [Http uploadImageRequest:req];
    Data *data = [Data new];
    data.error = resp.error;
    data.source = [resp.data mutableCopy];
    [data.source setObject:image forKey:@"image"];
    return data;
}

- (id)parse:(_Nonnull id)operation withSource:(id)source {
    return source;
}

@end
