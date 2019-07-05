//
//  DetailViewController.m
//  TestForSpeech
//
//  Created by Shane on 2019/7/4.
//  Copyright © 2019 Shane. All rights reserved.
//

#import "DetailViewController.h"
#import "VideoInfoCell.h"
#import "CSStickyHeaderFlowLayout.h"
#import "DetailHeaderView.h"

#import "CSAlwaysOnTopHeader.h"
#import "sectionHeaderView.h"

@interface DetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *coverImageView;
@property (nonatomic, strong) DetailHeaderView *headerView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self reloadLayout];
}

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor whiteColor];

//    [self.view addSubview:self.coverImageView];
    
    CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    CGRect rect = self.view.frame;
    rect.origin.y = 44;
    
    CSStickyHeaderFlowLayout *layout = [[CSStickyHeaderFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(VideoInfoCell.class) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:NSStringFromClass(VideoInfoCell.class)];
    [self.view addSubview:self.collectionView];
    
    
    self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(sectionHeaderView.class) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeaderView"];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(DetailHeaderView.class) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:CSStickyHeaderParallaxHeader withReuseIdentifier:NSStringFromClass(DetailHeaderView.class)];
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
}

- (void)reloadLayout
{
    CSStickyHeaderFlowLayout *layout = (id)self.collectionView.collectionViewLayout;
    
    if ([layout isKindOfClass:[CSStickyHeaderFlowLayout class]]) {
        layout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 200);
        layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(self.view.frame.size.width, 0);

        layout.parallaxHeaderAlwaysOnTop = YES;
        
        layout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 44);
        
        // If we want to disable the sticky header effect
        layout.disableStickyHeaders = YES;
    }
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoInfoCell *cell = (VideoInfoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(VideoInfoCell.class) forIndexPath:indexPath];
    cell.textLabel.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *view = (sectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeaderView" forIndexPath:indexPath];
        view.backgroundColor = [UIColor redColor];
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(15, 15)];
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.path = path.CGPath;
        layer.frame = view.bounds;
        view.layer.mask = layer;
        
        return view;
    }
    else if ([kind isEqualToString:CSStickyHeaderParallaxHeader]) {
        UICollectionReusableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                            withReuseIdentifier:NSStringFromClass(DetailHeaderView.class)
                                                                                   forIndexPath:indexPath];
        self.headerView = (DetailHeaderView *)cell;
        return cell;
    }
    return nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"scrollView %f", scrollView.contentOffset.y);
//    if (scrollView.contentOffset.y > 0) {
//        self.collectionView.backgroundColor = [UIColor whiteColor];
//    } else {
//        self.collectionView.backgroundColor = [UIColor clearColor];
//    }
}

- (UIView *)coverImageView
{
    if (!_coverImageView) {
        _coverImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 260)];
        _coverImageView.backgroundColor = [UIColor purpleColor];
    }
    
    return _coverImageView;
}

@end
