//
//  TestClass.m
//  Runtime1
//
//  Created by 王猛 on 2017/8/24.
//  Copyright © 2017年 WM. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

- (void)testMethodOne{
    
}

- (void)testMethodTwo{
    
}

+ (void)testClassMethodOne{
    
}

+ (NSString *)testClassMethodTwo{
    
    return nil;
}

- (void)click
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(click)]) {
        
        [self.delegate click];
        
    }
}

@end
