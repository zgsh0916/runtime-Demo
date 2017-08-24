//
//  WMRuntimeTool.h
//  Runtime1
//
//  Created by 王猛 on 2017/8/24.
//  Copyright © 2017年 WM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface WMRuntimeTool : NSObject

+ (NSMutableArray *)getPrivateAPi:(__unsafe_unretained Class)class;

+ (NSMutableArray *)getPropertyList:(__unsafe_unretained Class)class;

+ (NSMutableArray *)getIvarList:(__unsafe_unretained Class)class;

+ (NSMutableArray *)getProtocolList:(__unsafe_unretained Class)class;
@end
