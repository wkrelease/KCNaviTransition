//
//  KCTransitionInstance.m
//  KCRefresh
//
//  Created by king on 2018/11/30.
//  Copyright © 2018 KC. All rights reserved.
//

#import "KCTransitionInstance.h"

@implementation KCTransitionInstance

+ (instancetype)shareInstance {
    
    static KCTransitionInstance *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [KCTransitionInstance new];
    });
    return instance;
    
}

@end
