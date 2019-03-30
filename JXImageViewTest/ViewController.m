//
//  ViewController.m
//  JXImageViewTest
//
//  Created by G-Jayson on 2019/3/30.
//  Copyright © 2019 G-Jayson. All rights reserved.
//

#import "ViewController.h"
#import "JXImageViewPre.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat imageViewWidth = CGRectGetWidth(self.view.bounds) / 2 - 5;
    CGFloat imageViewHeight = 100;
    
    
    // ---  设置空图片  ---
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, imageViewWidth, imageViewHeight)];
    imageView.image = [UIImage imageNamed:@"5"];
    [self.view addSubview:imageView];
    
    
    // ---  设置空图片  ---
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, imageViewWidth, imageViewHeight)];
    [imageView1 jx_setImageWithImageName:@"5" placeholderImageName:@"2"];
    [self.view addSubview:imageView1];
    
    
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewWidth + 10, 50, 200, imageViewHeight)];
    [imageView2 jx_setImageWithImageName:@"1"];
    [imageView2 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView2");
    }];
    [self.view addSubview:imageView2];
    
    
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(imageView1.bounds) + 60, imageViewWidth, imageViewHeight)];
    [imageView3 jx_setWebImageWithImageUrl:@"https://b-ssl.duitang.com/uploads/item/201504/07/20150407H1649_HGXka.jpeg"];
    [imageView3 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView3");
    }];
    [self.view addSubview:imageView3];
    
    
    
    UIImageView *imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewWidth + 10, CGRectGetHeight(imageView1.bounds) + 60, imageViewWidth, imageViewHeight)];
    [imageView4 jx_setWebImageWithImageUrl:@"https://img3.duitang.com/uploads/item/201303/18/20130318230446_vkxmQ.thumb.700_0.jpeg"
                      placeholderImageName:@"1"];
    
    [imageView4 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView4");
    }];
    [self.view addSubview:imageView4];
    
    
    
    UIImageView *imageView5 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 2 * CGRectGetHeight(imageView1.bounds) + 70, imageViewWidth, imageViewHeight)];
    [imageView5 jx_setWebImageWithImageUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553936902675&di=1eb8a9db248b40ff223674f8e7cc903c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F14%2F20150314125630_QiSnB.thumb.700_0.jpeg"
                      placeholderImageName:@"1"
                                   options:SDWebImageLowPriority];
    
    [imageView5 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView5");
    }];
    [self.view addSubview:imageView5];
    
    
    
    UIImageView *imageView6 = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewWidth + 10, 2 * CGRectGetHeight(imageView1.bounds) + 70, imageViewWidth, imageViewHeight)];
    [imageView6 jx_setWebImageWithImageUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553937515579&di=9509a595b6c7eb2535ecc7a2a78ac704&imgtype=0&src=http%3A%2F%2Fdmimg.5054399.com%2Fallimg%2Foptuji%2Fopheji%2F25.jpg"
                      placeholderImageName:@"1"
                                   options:SDWebImageLowPriority
                                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                          
                                     NSLog(@"加载完成  imageView6");
                      }];
    
    [imageView6 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView6");
    }];
    [self.view addSubview:imageView6];
    
    
    
    UIImageView *imageView7 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3 * CGRectGetHeight(imageView1.bounds) + 80, imageViewWidth, imageViewHeight)];
    [imageView7 jx_setWebImageWithImageUrl:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553937575925&di=6f16041948b5f37fc09aff3472d5ad05&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2F320_180%2Fvideo%2F72%2F725f46ab4f1a033dd379de6094ae0015.jpg"
                      placeholderImageName:nil
                                   options:SDWebImageLowPriority
                                  progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                      NSLog(@"加载进度 %ld ----  %ld", receivedSize, expectedSize);
                                  } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      NSLog(@"加载完成  imageView7");
                                  }];
    
    [imageView7 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView7");
    }];
    [self.view addSubview:imageView7];
    
    
    UIImageView *imageView8 = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewWidth + 10, 3 * CGRectGetHeight(imageView1.bounds) + 80, imageViewWidth, imageViewHeight)];
    [imageView8 jx_setAnimationImagesWithImagsNameArray:@[@"1", @"2", @"3", @"4"]
                                               duration:0.5
                                            repeatCount:0
                                              autoStart:YES
                                            delayRemove:0];
    [imageView8 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView8");
    }];
    [self.view addSubview:imageView8];
    
    
    
    UIImageView *imageView9 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 4 * CGRectGetHeight(imageView1.bounds) + 90, imageViewWidth, imageViewHeight)];
    [imageView9 jx_setImageWithImageName:@"11" complete:^(BOOL success, NSError *error) {
        NSLog(@"加载结果  %d, error : %@", success, error);
    }];
    
    [imageView9 addTapActionBlock:^(UITapGestureRecognizer *tap) {
        NSLog(@"点击 imageView9");
    }];
    [self.view addSubview:imageView9];
    
}


@end
