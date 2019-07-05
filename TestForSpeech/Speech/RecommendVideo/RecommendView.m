//
//  RecommendView.m
//  TestForSpeech
//
//  Created by Shane on 2019/7/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "RecommendView.h"

@interface RecommendView ()

@property (nonatomic, strong) UIView *topBarView;
@property (nonatomic, strong) UIButton *foldButton;
@property (nonatomic, strong) UICollectionView *contentView;

@end

@implementation RecommendView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews
{
    [self addSubview:self.topBarView];
    [self.topBarView addSubview:self.foldButton];
}

#pragma mark - Lazy load
- (UIView *)topBarView
{
    if (!_topBarView) {
        _topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
        _topBarView.backgroundColor = [UIColor redColor];
    }
    
    return _topBarView;
}

- (UIButton *)foldButton
{
    if (!_foldButton) {
        _foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _foldButton.frame = CGRectMake(self.frame.size.width - 32 - 16, 6, 32, 32);
        _foldButton.backgroundColor = [UIColor yellowColor];
        [_foldButton setTitle:@"⬇️" forState:UIControlStateNormal];
        [_foldButton setTitle:@"⤴️" forState:UIControlStateSelected];
    }
    
    return _foldButton;
}

@end
