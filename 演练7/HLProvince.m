//
//  HLProvince.m
//  演练7
//
//  Created by 刘宏立 on 16/6/24.
//  Copyright © 2016年 lhl. All rights reserved.
//

#import "HLProvince.h"

@implementation HLProvince

+ (instancetype)provinceNameWithDict:(NSDictionary *)dict{
    //创建并返回一个字典,将这个字典传给当前类:HLProvince 即self 进行返回
    return [[self alloc]initWithDictionary:dict];

}

- (instancetype)initWithWithDict:(NSDictionary *)dict{
    //初始化父类:[super init], 然后将初始化的父类赋给 当前类:HLProvince,即self
    self = [super init];
    //判断是否是当前类HLProvince,如果是当前类HLProvince,即得self,就进行下一步动作
    if (self) {
        //HLProvince 调用set方法 set设置了:利用字典设置键值,,整句话:利用字典为 HLProvince(模型) 类设置键值
        [self setValuesForKeysWithDictionary:dict];
    }
    //设置键之后的返回动作,返回当前类:HLProvince ,即self
    return self;

}

- (NSString *)description{
    //创建一个键值数组存储键值: keys,准备下一步将keys里的数据传给当前类:HLProvince
    NSArray *keys = @[@"provinceName", @"cities"];
    
    //HLProvince (模型)调用键值(get),即现在,已将provinceName,cities 传给keys,最终传给了 HLProvince 类,在之后的代码中直接调用 HLProvince 类即可获得键值,达到传递模型中数据的目的
    return [self dictionaryWithValuesForKeys:keys].description;

}

@end
