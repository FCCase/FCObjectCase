//
//  Target_Object.m
//  FCObjectCase
//
//  Created by 石富才 on 2020/12/19.
//

#import "Target_Object.h"
#import "FCNumberFormatterVC.h"

@implementation Target_Object

/**
 数字格式化 "Object/NumberFormatterVC"
 */
- (UIViewController *)Action_NumberFormatterVC:(NSDictionary *)params{
    return FCNumberFormatterVC.new;
}

@end
