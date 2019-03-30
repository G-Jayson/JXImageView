//
//  UIImageView+JXImageView.h
//  JXImageViewTest
//
//  Created by G-Jayson on 2019/3/30.
//  Copyright © 2019 G-Jayson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"


@interface UIImageView (JXImageView)

@property (nonatomic, copy) void(^block)(UITapGestureRecognizer *);


/**
 * 添加 ImageView 点击事件
 @prama block                   回调
 */
- (void)addTapActionBlock:(void (^)(UITapGestureRecognizer *tap))block;


/**
 * set 本地image
 @prama imageName               图片名称
 */
- (void)jx_setImageWithImageName:(NSString *)imageName;


/**
 * set 本地image
 @prama imageName               图片名称
 @prama complete                加载完成回调
 */
- (void)jx_setImageWithImageName:(NSString *)imageName complete:(void (^)(BOOL success, NSError *error))complete;


/**
 * set 本地 image                若失败，设置占位图
 @prama imageName               图片名称
 @prama placeholderImageName    占位图
 */
- (void)jx_setImageWithImageName:(NSString *)imageName
            placeholderImageName:(NSString *)placeholderImageName;


/**
 * set web image
 @prama imageName               图片名称
 */
- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl;


/**
 * set web image
 @prama imageName 图片名称
 @prama placeholderImageName    占位图
 */
- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName;


/**
 * set web image
 @prama imageName               图片名称
 @prama placeholderImageName    占位图
 */
- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName
                           options:(SDWebImageOptions)options;


/**
 * set web image
 @prama imageName               图片名称
 @prama placeholderImageName    占位图
 @prama completedBlock          加载成功回调
 */
- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName
                           options:(SDWebImageOptions)options
                         completed:(SDWebImageCompletionBlock)completedBlock;


/**
 * set web image
 @prama imageName               图片名称
 @prama placeholderImageName    占位图
 @prama progressBlock           加载进度
 @prama completedBlock          加载成功回调
 */
- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName
                           options:(SDWebImageOptions)options
                          progress:(SDWebImageDownloaderProgressBlock)progressBlock
                         completed:(SDWebImageCompletionBlock)completedBlock;


/**
 * 简单动画
  @prama imagsNameArray         图片名称数组
  @prama duration               每张图轮播的时间
  @prama repeatCount            重复次数  0 为一直循环
  @prama autoStart              是否自动开始
  @prama delayRemove            时间后移除  0 不移除
 */
- (void)jx_setAnimationImagesWithImagsNameArray:(NSArray *)imagsNameArray
                                   duration:(NSTimeInterval)duration
                                repeatCount:(NSInteger)repeatCount
                                  autoStart:(BOOL)autoStart
                                delayRemove:(NSTimeInterval)delayRemove;


@end

