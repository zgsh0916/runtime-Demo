//
//  WMRuntimeTool.m
//  Runtime1
//
//  Created by 王猛 on 2017/8/24.
//  Copyright © 2017年 WM. All rights reserved.
//

#import "WMRuntimeTool.h"

@implementation WMRuntimeTool
unsigned int count;
#pragma mark -- 获取某个类的私有方法
+ (NSMutableArray *)getPrivateAPi:(__unsafe_unretained Class)class
{
    NSMutableArray *methodArray = [NSMutableArray array];
    
    Method *methodList = class_copyMethodList([class class], &count);
    
    for (unsigned int i= 0 ; i < count; i++) {
        
        Method method = methodList[i];
        [methodArray addObject:NSStringFromSelector(method_getName(method))];
        
    }
    
    return methodArray;
}

#pragma mark -- 获取属性列表
+ (NSMutableArray *)getPropertyList:(__unsafe_unretained Class)class
{
    NSMutableArray *propertyArrray = [NSMutableArray array];
    
    objc_property_t *propertyList = class_copyPropertyList([class class], &count);
    
    for (unsigned int i = 0; i < count; i++) {
        
        const char *propertyName = property_getName(propertyList[i]);
        //NSLog(@"property -->%@",[NSString stringWithUTF8String:propertyName]);
        [propertyArrray addObject:[NSString stringWithUTF8String:propertyName]];
    }
    return propertyArrray;
    
}

#pragma mark -- 获取成员变量列表
+ (NSMutableArray *)getIvarList:(__unsafe_unretained Class)class
{
    NSMutableArray *ivarArrray = [NSMutableArray array];
    Ivar *ivarList = class_copyIvarList([class class], &count);
    for (unsigned int i = 0; i < count; i++) {
        
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        [ivarArrray addObject:[NSString stringWithUTF8String:ivarName]];
        
    }
    return ivarArrray;
    
}

#pragma mark -- 获取协议列表
+ (NSMutableArray *)getProtocolList:(__unsafe_unretained Class)class
{
    NSMutableArray *protocolArrray = [NSMutableArray array];
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([class class], &count);
    
    for (unsigned int i = 0; i < count; i++) {
        
        Protocol *myProtocol = protocolList[i];
        
        const char *protocolName = protocol_getName(myProtocol);
        
        [protocolArrray addObject:[NSString stringWithUTF8String:protocolName]];
        
    }
    
    return protocolArrray;
    
}
/*
 *  如果用实例对象调用实例方法,就会到实例的isa指针指向的对象(也就是类对象操作)
 *  如果调用的是类方法,就会到类对象的isa指针指向的对象(也就是元类对象操作)
 *  1、在相应操作的对象中的缓存方法列表中找调用的方法,如果找到就转向相应的实现并执行
 *  2、如果没找到,在相应操作的对象中的方法列表中找调用的方法,如果找到转向相应的实现并执行
 *  3、如果没找到,去父类指针所指向的对象中执行1、2
 *  4、以此类推,如果一直到基类还没找到,转向拦截调用.
 *  5、如果没有重写拦截调用的方法,程序报错.
 *
 */


void runAddMethod(id self,SEL _cmd,NSString *string)
{
    NSLog(@"add C IMP %@",string);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel class:(__unsafe_unretained Class)class
{
    //给类动态添加一个方法
    if ([NSStringFromSelector(sel) isEqualToString:@"resolveAdd"]) {
        
        class_addMethod([class class], sel, (IMP)runAddMethod, "v@:*");
        
    }
    
    return YES;
}

@end
