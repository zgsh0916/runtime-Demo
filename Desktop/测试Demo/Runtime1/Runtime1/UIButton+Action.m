//
//  UIButton+Action.m
//  Runtime1
//
//  Created by 王猛 on 2017/8/23.
//  Copyright © 2017年 WM. All rights reserved.
//

#import "UIButton+Action.h"
static NSString *keyOfMethod;
static NSString *keyOfBlock;
@implementation UIButton (Action)

+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock
{
    UIButton *button = [[UIButton alloc] init];
    button.frame = frame;
    [button setTitle:title forState:0];
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    //1:表示关联者,是一个对象 2:获取被关联的索引key 3:被关联者,这里是一个block 4:关联采用的协议
    objc_setAssociatedObject(button, &keyOfMethod, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    return button;
}

- (void)buttonClick:(UIButton *)button
{
    //通过key获取被关联对象
    //objc_getAssociatedObject(id object,const void *key)
    ActionBlock block1 = objc_getAssociatedObject(button, &keyOfMethod);
    if (block1) {
        block1(button);
    }
    
    ActionBlock block2 = objc_getAssociatedObject(button, &keyOfBlock);
    if (block2) {
        block2(button);
    }
    
}

- (void)setActionBlock:(ActionBlock)actionBlock
{
    objc_setAssociatedObject(self, &keyOfBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ActionBlock)actionBlock
{
    return objc_getAssociatedObject(self, &keyOfBlock);
}


@end
