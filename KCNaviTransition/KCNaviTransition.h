//
//  KCNaviTransition.h
//  KCRefresh
//
//  Created by king on 2018/11/29.
//  Copyright © 2018 KC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KCNaviTransition : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic,assign)UINavigationControllerOperation type;
@end

NS_ASSUME_NONNULL_END
