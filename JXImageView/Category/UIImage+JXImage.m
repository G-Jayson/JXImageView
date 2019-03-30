//
//  UIImage+JXImage.m
//  JXImageViewTest
//
//  Created by G-Jayson on 2019/3/30.
//  Copyright © 2019 G-Jayson. All rights reserved.
//

#import "UIImage+JXImage.h"
#import <objc/runtime.h>


@implementation UIImage (JXImage)

+ (void)load {
    swizzleMethod([self class], @selector(imageNamed:), @selector(jx_imageNamed:));
}


+ (UIImage *)jx_imageNamed:(NSString *)imageName {
    UIImage *image = [UIImage jx_imageNamed:imageName];
    if (image) {
        NSLog(@"%@ 加载成功", imageName);
    } else {
        NSLog(@"%@ 加载失败", imageName);
    }
    
    return image;
}


void swizzleMethod(Class class, SEL originalSelector, SEL swizzleSelector) {
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzleMethod = class_getClassMethod(class, swizzleSelector);
    method_exchangeImplementations(originalMethod, swizzleMethod);
}


@end
