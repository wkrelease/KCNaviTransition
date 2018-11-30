//
//  KCNaviTransition.m
//  KCRefresh
//
//  Created by king on 2018/11/29.
//  Copyright © 2018 KC. All rights reserved.
//

#import "KCNaviTransition.h"
#import "KCTransitionInstance.h"

static CGFloat const defaultDuration = 0.5f;

@interface KCNaviTransition()<CAAnimationDelegate>
@property (nonatomic,strong)id<UIViewControllerContextTransitioning> transitionContext;
@end

@implementation KCNaviTransition

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return  defaultDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    self.transitionContext = transitionContext;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *_fromView = [KCTransitionInstance shareInstance].fromView;
    
    if (_type == UINavigationControllerOperationPop) {
       
        UIView *containerView = [transitionContext containerView];
        [containerView addSubview:toVC.view];
        [containerView addSubview:fromVC.view];
        UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:_fromView.frame];
        CGPoint finalPoint;
        
        //判断触发点在那个象限
        if(_fromView.frame.origin.x > (toVC.view.bounds.size.width / 2)){
            if (_fromView.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
                //第一象限
                finalPoint = CGPointMake(_fromView.center.x - 0, _fromView.center.y - CGRectGetMaxY(toVC.view.bounds));
            }else{
                //第四象限
                finalPoint = CGPointMake(_fromView.center.x - 0, _fromView.center.y - 0);
            }
        }else{
            if (_fromView.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
                //第二象限
                finalPoint = CGPointMake(_fromView.center.x - CGRectGetMaxX(toVC.view.bounds), _fromView.center.y - CGRectGetMaxY(toVC.view.bounds));
            }else{
                //第三象限
                finalPoint = CGPointMake(_fromView.center.x - CGRectGetMaxX(toVC.view.bounds), _fromView.center.y - 0);
            }
        }
        
        CGFloat radius = sqrt(finalPoint.x * finalPoint.x + finalPoint.y * finalPoint.y);
        UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(_fromView.frame, -radius, -radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = finalPath.CGPath;
        fromVC.view.layer.mask = maskLayer;
        CABasicAnimation *pingAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        pingAnimation.fromValue = (__bridge id)(startPath.CGPath);
        pingAnimation.toValue   = (__bridge id)(finalPath.CGPath);
        pingAnimation.duration = [self transitionDuration:transitionContext];
        pingAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pingAnimation.delegate = self;
        [maskLayer addAnimation:pingAnimation forKey:@"pingInvert"];
        
    }else{
        
        UIView *containerView = [transitionContext containerView];
        [containerView addSubview:fromVC.view];
        [containerView addSubview:toVC.view];
        UIBezierPath *maskStartBP = [UIBezierPath bezierPathWithOvalInRect:_fromView.frame];
        CGPoint finalPoint;
        
        //判断触发点在那个象限
        if(_fromView.frame.origin.x > (toVC.view.bounds.size.width / 2)){
            if (_fromView.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
                //第一象限
                finalPoint = CGPointMake(_fromView.center.x - 0, _fromView.center.y - CGRectGetMaxY(toVC.view.bounds));
            }else{
                //第四象限
                finalPoint = CGPointMake(_fromView.center.x - 0, _fromView.center.y - 0);
            }
        }else{
            if (_fromView.frame.origin.y < (toVC.view.bounds.size.height / 2)) {
                //第二象限
                finalPoint = CGPointMake(_fromView.center.x - CGRectGetMaxX(toVC.view.bounds), _fromView.center.y - CGRectGetMaxY(toVC.view.bounds));
            }else{
                //第三象限
                finalPoint = CGPointMake(_fromView.center.x - CGRectGetMaxX(toVC.view.bounds), _fromView.center.y - 0);
            }
        }
        
        CGFloat radius = sqrt(finalPoint.x * finalPoint.x + finalPoint.y * finalPoint.y);
        UIBezierPath *maskFinalBP = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(_fromView.frame, -radius, -radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = maskFinalBP.CGPath;
        toVC.view.layer.mask = maskLayer;
        CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        maskLayerAnimation.fromValue = (__bridge id)(maskStartBP.CGPath);
        maskLayerAnimation.toValue = (__bridge id)((maskFinalBP.CGPath));
        maskLayerAnimation.duration = [self transitionDuration:transitionContext];
        maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        maskLayerAnimation.delegate = self;
        [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
     
    }
    
}

#pragma mark - CABasicAnimation的Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask = nil;
    [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.layer.mask = nil;
}


@end
