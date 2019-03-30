//
//  UIImageView+JXImageView.m
//  JXImageViewTest
//
//  Created by G-Jayson on 2019/3/30.
//  Copyright © 2019 G-Jayson. All rights reserved.
//

#import "UIImageView+JXImageView.h"
#import <objc/runtime.h>

static void *blockKey = &blockKey;

@implementation UIImageView (JXImageView)


- (void)addTapActionBlock:(void (^)(UITapGestureRecognizer *))block {
    self.block = block;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)]];
}



- (void)tapAction:(UITapGestureRecognizer *)tap {
    if (self.block) {
        self.block(tap);
    }
}



- (void)jx_setImageWithImageName:(NSString *)imageName {
    self.image = [UIImage imageNamed:imageName];
}



- (void)jx_setImageWithImageName:(NSString *)imageName complete:(void (^)(BOOL success, NSError *error))complete {
    self.image = [UIImage imageNamed:imageName];
    
    if (self.image) {
        complete(YES, nil);
    } else {
        NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: NSLocalizedStringFromTable(@"Image does‘t exist", @"JXImageView", nil)};
        NSError *error = [[NSError alloc] initWithDomain:NSCocoaErrorDomain code:999 userInfo:userInfo];
        complete(NO, error);
    }
}



- (void)jx_setImageWithImageName:(NSString *)imageName
            placeholderImageName:(NSString *)placeholderImageName {
    if (self.image) {
        self.image = [UIImage imageNamed:imageName];
    } else {
        self.image = [UIImage imageNamed:placeholderImageName];
    }
}



- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl {
    [self jx_setWebImageWithImageUrl:imageUrl
                placeholderImageName:nil
                             options:0
                            progress:nil
                           completed:nil];
}



- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName {
    [self jx_setWebImageWithImageUrl:imageUrl
                placeholderImageName:placeholderImageName
                             options:0 progress:nil
                           completed:nil];
}



- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName
                           options:(SDWebImageOptions)options {
    [self jx_setWebImageWithImageUrl:imageUrl
                placeholderImageName:placeholderImageName
                             options:options
                            progress:nil
                           completed:nil];
}



- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName
                           options:(SDWebImageOptions)options
                         completed:(SDWebImageCompletionBlock)completedBlock {
    [self jx_setWebImageWithImageUrl:imageUrl
                placeholderImageName:placeholderImageName
                             options:options
                            progress:nil
                           completed:completedBlock];
}



- (void)jx_setWebImageWithImageUrl:(NSString *)imageUrl
              placeholderImageName:(NSString *)placeholderImageName
                           options:(SDWebImageOptions)options
                          progress:(SDWebImageDownloaderProgressBlock)progressBlock
                         completed:(SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:[NSURL URLWithString:imageUrl]
            placeholderImage:placeholderImageName ? [UIImage imageNamed:placeholderImageName] : nil
                     options:options
                    progress:progressBlock
                   completed:completedBlock];
}



- (void)jx_setAnimationImagesWithImagsNameArray:(NSArray *)imagsNameArray
                                   duration:(NSTimeInterval)duration
                                repeatCount:(NSInteger)repeatCount
                                  autoStart:(BOOL)autoStart
                                delayRemove:(NSTimeInterval)delayRemove {
    
    NSMutableArray *imagesArr = [NSMutableArray arrayWithCapacity:0];
    
    for (NSString *imageName in imagsNameArray) {
        [imagesArr addObject:[UIImage imageNamed:imageName]];
    }
    self.animationImages = imagesArr;
    self.animationDuration = duration;
    self.animationRepeatCount = repeatCount;
    
    if (autoStart) {
        [self startAnimating];
    }
 
    if (delayRemove > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayRemove * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stopAnimating];
            [self removeFromSuperview];
        });
    }
}



- (void)setBlock:(void (^)(UITapGestureRecognizer *))block {
    objc_setAssociatedObject(self, &blockKey, block, OBJC_ASSOCIATION_COPY);
}



- (void (^)(UITapGestureRecognizer *))block {
    return objc_getAssociatedObject(self, &blockKey);
}



@end
