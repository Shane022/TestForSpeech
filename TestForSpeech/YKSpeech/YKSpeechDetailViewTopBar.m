//
//  YKSpeechDetailViewTopBar.m
//  TestForSpeech
//
//  Created by Shane on 2019/7/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "YKSpeechDetailViewTopBar.h"

@interface YKSpeechDetailViewTopBar ()

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *shareButton;

@end

@implementation YKSpeechDetailViewTopBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews
{
    [self addSubview:self.backButton];
    [self addSubview:self.shareButton];
    
    // TODO:test
    self.backButton.backgroundColor = [UIColor redColor];
    self.shareButton.backgroundColor = [UIColor yellowColor];
    //
    
    
}

#pragma mark - Actions
- (void)clickBackButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(didSelectBackButton:)]) {
        [self.delegate didSelectBackButton:button];
    }
}

- (void)clickShareButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(didSelectShareButton:)]) {
        [self.delegate didSelectShareButton:button];
    }
}

#pragma mark - Lazy load
- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

- (UIButton *)shareButton
{
    if (!_shareButton) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton addTarget:self action:@selector(clickShareButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _shareButton;
}

@end
