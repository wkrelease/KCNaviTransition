//
//  KCTransitionVC.m
//  KCRefresh
//
//  Created by king on 2018/11/30.
//  Copyright © 2018 KC. All rights reserved.
//

#import "KCTransitionVC.h"
#import "KCNaviTransition.h"

@interface KCTransitionVC ()<UINavigationControllerDelegate>

@end

@implementation KCTransitionVC

#pragma mark - LifeCycle

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.delegate = self;
}

#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    KCNaviTransition *ping = [KCNaviTransition new];
    ping.type = operation;
    return ping;
}

@end
