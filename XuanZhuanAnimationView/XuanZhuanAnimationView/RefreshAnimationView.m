//
//  RefreshAnimationView.m
//  XuanZhuanAnimationView
//
//  Created by zhang on 16/1/27.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "RefreshAnimationView.h"

@interface RefreshAnimationView ()

@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic)BOOL isPlay;

@end

@implementation RefreshAnimationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createContentViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createContentViews];
    }
    return self;
}

- (void)createContentViews
{
    self.layer.cornerRadius = 7.0;
    self.layer.masksToBounds = YES;
    
    [self addSubview:[self getBgImageView]];
    [self addSubview:[self getImageView]];
    [self addAnimationToView];
}

//设置动画
- (void)addAnimationToView
{
    CABasicAnimation *logoAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    logoAnimation.toValue = [NSNumber numberWithFloat:2.0 *M_PI];
    logoAnimation.duration = 1.5f;
    logoAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    logoAnimation.cumulative = NO;
    logoAnimation.removedOnCompletion = NO; //No Remove
    
    logoAnimation.repeatCount = HUGE_VAL;
    [self.imageView.layer addAnimation:logoAnimation forKey:@"AnimatedKey"];
    [self.imageView stopAnimating];
    
    // 加载动画 但不播放动画
    self.imageView.layer.speed = 2.0;

}

//开始动画
- (void)startAnimate{
    if (!self.isPlay) {
        self.isPlay = YES;
        self.imageView.layer.speed = 1.0;
        self.imageView.layer.beginTime = 0.0;
        CFTimeInterval pausedTime = [self.imageView.layer timeOffset];
        CFTimeInterval timeSincePause = [self.imageView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        self.imageView.layer.beginTime = timeSincePause;
    }
    
    
}
//停止动画并保存当前的角度
- (void)endAnimate{
    if (self.isPlay) {
        self.isPlay = NO;
        CFTimeInterval pausedTime = [self.imageView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        self.imageView.layer.speed = 0.0;
        self.imageView.layer.timeOffset = pausedTime;
        
    }
}

- (UIImageView *)getBgImageView
{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _bgImageView.image = [UIImage imageNamed:@"refresh_bg"];
        return _bgImageView;
    }
    return _bgImageView;
}

- (UIImageView *)getImageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
        _imageView.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        _imageView.image = [UIImage imageNamed:@"refresh_logo"];
        return _imageView;
    }
    return _imageView;
}


@end
