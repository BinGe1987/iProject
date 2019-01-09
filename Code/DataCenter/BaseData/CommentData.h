//
//  CommentData.h
//  APP
//
//  Created by BinGe on 2019/1/2.
//

#import "Data.h"
#import "ImageData.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentData : Data

@property (nonatomic, strong) UserData *user;           //评论的用户
@property (nonatomic, strong) ClubData *club;           //评论所对应会所信息
@property (nonatomic, strong) TechData *tech;           //评论所对应技师信息
@property (nonatomic, strong) ListData *imageList;      //图片列表

@property (nonatomic, copy) NSString *commentId;        //id
@property (nonatomic, copy) NSString *commentType;      //评论类型
@property (nonatomic, copy) NSString *createTime;       //评论时间
@property (nonatomic, copy) NSString *content;          //评论内容
@property (nonatomic, copy) NSString *commentCount;     //回复条数
@property (nonatomic, copy) NSString *likeCount;        //点赞数
@property (nonatomic, copy) NSString *score;            //评分



@end

NS_ASSUME_NONNULL_END
