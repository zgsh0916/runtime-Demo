//
//  UIViewController+runtime.m
//  Runtime1
//
//  Created by 王猛 on 2017/8/24.
//  Copyright © 2017年 WM. All rights reserved.
//

#import "UIViewController+runtime.h"
#import <objc/runtime.h>

@implementation UIViewController (runtime)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        //获取两个方法的method
        Method originalMethod = class_getInstanceMethod(self, @selector(viewDidLoad));
        
        Method swizzledMethod = class_getInstanceMethod(self, @selector(swizzled_viewDidLoad));
        
        //先动态添加方法,实现被交换的方法,返回值表示添加成功还是失败
        BOOL didAddMethod = class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            
            //如果交换成功 说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod([self class],@selector(swizzled_viewDidLoad), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
            
        }else
        {   //没添加成功,交换两个方法的实现
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}

- (void)swizzled_viewDidLoad
{
    [self swizzled_viewDidLoad];
    if ([self isKindOfClass:[UITableViewController class]]) {
        
        self.view.backgroundColor = [UIColor redColor];
        
    }else if ([self isKindOfClass:[UIViewController class]])
    {
        self.view.backgroundColor = [UIColor blueColor];
    }
    
}

@end
