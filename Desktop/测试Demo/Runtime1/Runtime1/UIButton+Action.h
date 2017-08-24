//
//  UIButton+Action.h
//  Runtime1
//
//  Created by 王猛 on 2017/8/23.
//  Copyright © 2017年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


typedef void(^ActionBlock)(UIButton *button);
@interface UIButton (Action)

@property (nonatomic, copy) ActionBlock actionBlock;

//利用runtime关联系统类属性
+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock;

@end
