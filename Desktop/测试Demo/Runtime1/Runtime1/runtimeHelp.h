//
//  runtimeHelp.h
//  Runtime1
//
//  Created by 王猛 on 2017/8/24.
//  Copyright © 2017年 WM. All rights reserved.
//

#ifndef runtimeHelp_h
#define runtimeHelp_h

typedef struct objc_method *Method;//描述类中的一个方法

typedef struct objc_ivar *Ivar;//实例变量

typedef struct objc_category *Category;//类别

typedef struct objc_property *objc_property_t;

//类在runtime中的表示
struct objc_class{
    
    Class isa;//指针,顾名思义,表示是一个什么
    //实例的isa
#if !_OBJC2_
    Class super_class;//指向父类
    const char *name;//类名
    long version;
    long info;
    long instance;
    struct objc_ivar_list *ivars;//成员变量列表
    struct objc_method_list *methodLists;//方法列表
    struct objc_cache *cache;//缓存
    //一种优化,调用过的方法存在缓存列表,下次调用先找缓存
    struct objc_protocol_list *protocols//协议列表
#end
}OBJC2_UNAVAILABLE;




#endif /* runtimeHelp_h */
