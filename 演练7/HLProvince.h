//
//  HLProvince.h
//  演练7
//
//  Created by 刘宏立 on 16/6/24.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLProvince : NSObject

/**
 *省份名字
 */
@property(nonatomic,copy)NSString *name;

/**
 *城市数组的NSString泛型
 */
@property(nonatomic,strong)NSArray <NSString *> *cities;

//模型构造函数
+ (instancetype)nameWithDict:(NSDictionary *)dict;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
