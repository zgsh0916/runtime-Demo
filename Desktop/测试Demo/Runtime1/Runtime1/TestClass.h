//
//  TestClass.h
//  Runtime1
//
//  Created by 王猛 on 2017/8/24.
//  Copyright © 2017年 WM. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TestClassDelegate <NSObject>

- (void)click;

@end

@interface TestClass : NSObject
{
    NSInteger _count;
    NSDictionary *_dict;
}
@property (nonatomic, strong) NSString *testString;

@property (nonatomic, strong) NSArray *testArray;

@property (nonatomic,weak) id<TestClassDelegate>delegate;

- (void)testMethodOne;

- (void)testMethodTwo;

+ (void)testClassMethodOne;

+ (NSString *)testClassMethodTwo;



@end
