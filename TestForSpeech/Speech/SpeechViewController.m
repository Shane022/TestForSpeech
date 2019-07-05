//
//  SpeechViewController.m
//  TestForSpeech
//
//  Created by Shane on 2019/7/3.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "SpeechViewController.h"
#import "DetailViewController.h"
#import "VideoController.h"

@interface SpeechViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) DetailViewController *detailController;
@property (nonatomic, strong) VideoController *videoController;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *shareButton;

@end

@implementation SpeechViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)initData
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    
    self.detailController = [[DetailViewController alloc] init];
    [self addChildViewController:self.detailController];
    [self.scrollView addSubview:self.detailController.view];
    
    self.videoController = [[VideoController alloc] init];
    [self addChildViewController:self.videoController];
    [self.scrollView addSubview:self.videoController.view];
    CGRect videoViewRect = self.videoController.view.frame;
    videoViewRect.origin.x = [UIScreen mainScreen].bounds.size.width;
    self.videoController.view.frame = videoViewRect;
    
    [self.view insertSubview:self.backButton atIndex:self.scrollView.subviews.count];
    [self.view insertSubview:self.shareButton atIndex:self.scrollView.subviews.count];
    
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 0);
}

#pragma mark - Actions
- (void)clickBackButton:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    NSLog(@"%f", offset);
    self.shareButton.alpha = 1 - offset;
}

#pragma mark - Lazy load
- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(16, 44 + 16, 46, 46);
        _backButton.backgroundColor = [UIColor redColor];
        [_backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backButton;
}

- (UIButton *)shareButton
{
    if (!_shareButton) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shareButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 16 - 46, 44 + 16, 46, 46);
        _shareButton.backgroundColor = [UIColor greenColor];
    }
    
    return _shareButton;
}

@end
