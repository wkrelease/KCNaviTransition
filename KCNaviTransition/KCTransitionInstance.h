//
//  KCTransitionInstance.h
//  KCRefresh
//
//  Created by king on 2018/11/30.
//  Copyright © 2018 KC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KCTransitionInstance : NSObject

/** 动画起始点 */
@property (nonatomic,strong)UIView *fromView;

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
