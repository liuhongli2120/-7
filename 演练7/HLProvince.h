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
 *省份名字,这里的省份的名字一定要和数据中的名字一致,因下面写入键值的时候是和数据中的一致的,这个地方如果不一直就会导致找不到减值的情况,在加载数据的时候就会导致程序崩溃
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
